/* Copyright 2013, Gurobi Optimization, Inc. */

/*
A program that generates a random instance of n-by-n assignment problem and solves it using Gurobi Optimizer. 
Program will get n as input. The values of the cost matrix should be between 0 and 1.Program uses uniform distribution.
*/

//@author : bahaddin

import java.util.Random;
import java.io.*;

import gurobi.*;

public class AssignmentProblem {
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
      GRBEnv    env   = new GRBEnv("assgnmntprblm.log");
      GRBModel  model = new GRBModel(env);

      int i,j;
      
   // Create variables
      
      GRBVar[][] x = new GRBVar[n][n];

      for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
           
        	 x[i][j] = model.addVar(0.0, 1.0, 0.0, GRB.BINARY, "x[i][j]");
          }
        }
      
   // Integrate new variables
      
      model.update();
      

   // Set objective: minimize the sum of c[i][j]*x[i][j]
      
      Random num = new Random();
      float[][] c = new float[n][n];
      
      
      GRBLinExpr expr = new GRBLinExpr();
      for (i = 0; i < n; i++) {
          for (j = 0; j < n; j++) {
        	  c[i][j] = num.nextFloat();
        	  expr.addTerm(c[i][j], x[i][j]); 
          }
          
      }
      
      model.setObjective(expr, GRB.MINIMIZE);
      
      // Add constraints: sum of all X[i][j] = 1 for j=0...n
      
      for (i = 0; i < n; i++) {
    	  expr = new GRBLinExpr();
          for (j = 0; j < n; j++) {
        	  expr.addTerm(1.0, x[i][j]);
          }
          model.addConstr(expr, GRB.EQUAL, 1, "xij");
      }
      
   // Add constraints: sum of all X[i][j] = 1 for i=0...n
      
      for (j = 0; j < n; j++) {
    	  expr = new GRBLinExpr();
          for (i = 0; i < n; i++) {
        	  expr.addTerm(1.0, x[i][j]);
          }
          model.addConstr(expr, GRB.EQUAL, 1, "xji");
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
