/* Copyright 2013, Gurobi Optimization, Inc. */

/*
A program that generates a random instance of bin packing problem and solves it using Gurobi Optimizer. 
Program will get the number of items n as input. 
The capacity of each bin should be 10 and weight values of each item should be between 0 and 1. Uses uniform distribution. 
*/

// @author : bahaddin

import java.io.*;

import gurobi.*;

public class BinPackingProblem {
  public static void main(String[] args) {
	  
	 int n=0;
	 try { 
	  BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
	  System.out.printf("Enter n : ");
	  String s = reader.readLine();
	  n=Integer.parseInt(s);
	 }
	 
	 catch(java.io.IOException ioex) {
		 System.out.print("Argument error: ");
			ioex.printStackTrace();
			System.exit(1);
	 }
	 
	 catch(NumberFormatException nfex) {
			System.out.println(nfex.getMessage() + " not a numerical value.");
			System.exit(1);
		}
	 
    try {
      GRBEnv    env   = new GRBEnv("bnpckngprblm.log");
      GRBModel  model = new GRBModel(env);

      int i,j;
      double bW=10;
      
      
   // Create variables
      
      GRBVar[][] x = new GRBVar[n][n];

      for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
           
        	 x[i][j] = model.addVar(0.0, 1.0, 0.0, GRB.BINARY, "x[i][j]");
          }
        }
      
      GRBVar[] y = new GRBVar[n];

      for (j = 0; j < n; j++) {
           
        	 y[j] = model.addVar(0.0, 1.0, 0.0, GRB.BINARY, "y[j]");
     	}
    
      /*
      GRBVar[] w = new GRBVar[n];

      for (j = 0; j < n; j++) {
           
        	 w[j] = model.addVar(0.0, 1.0, 0.0, GRB.CONTINUOUS, "w[j]");
     	}
      */
      
   // Integrate new variables
      
      model.update();
      

   // Set objective: minimize the sum of y[j]
      
      
      GRBLinExpr expr = new GRBLinExpr();
      
      for (j = 0; j < n; j++) {
    	  expr.addTerm(1.0,y[j]); 
      	}
          
      model.setObjective(expr, GRB.MINIMIZE);
      
      // Add constraints: sum of all X[i][j] = 1 for i=1...n
      
      
      for (i = 0; i < n; i++) {
    	  expr = new GRBLinExpr();
          for (j = 0; j < n; j++) {
        	  expr.addTerm(1.0, x[i][j]);
          }
          model.addConstr(expr, GRB.EQUAL, 1, "xij");
      }
      
   // Add constraints: sum of all w[i]*x[i][j] =< W.y[j] for j=1...n
      
      double[] w = new double[n];
	  for (i = 0; i < n; i++) {
    		  w[i] = Math.random(); 
    	  }
      
      for (j = 0; j < n; j++) {
    	  expr = new GRBLinExpr();
          for (i = 0; i < n; i++) {
        	  expr.addTerm(w[i], x[i][j]);
        	  expr.addTerm(-bW,y[j]);
          }
          model.addConstr(expr, GRB.LESS_EQUAL, 0, "w*x-W*y");
      }

      // Optimize model

      model.optimize();

      /*
      for (i = 0; i < n; i++) {
          for (j = 0; j < n; j++) {
        	  System.out.println(x[i][j].get(GRB.StringAttr.VarName)
                      + " " +x[i][j].get(GRB.DoubleAttr.X));
          }
          
      }*/

      System.out.println("Obj: " + model.get(GRB.DoubleAttr.ObjVal));

      // Dispose of model and environment

      model.dispose();
      env.dispose();

    } catch (GRBException e) {
      System.out.println("Error code: " + e.getErrorCode() + ". " +
                         e.getMessage());
    }
  }
}
