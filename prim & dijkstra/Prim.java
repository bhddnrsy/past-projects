/*
Algorithm
1) Create a set mstSet that keeps track of vertices already included in MST.
2) Assign a key value to all vertices in the input graph. Initialize all key values as INFINITE. 
   Assign key value as 0 for the first vertex so that it is picked first.
3) While mstSet doesn’t include all vertices
a)	Pick a vertex u which is not there in mstSet and has minimum key value.
b)  Include u to mstSet.
c)  Update key value of all adjacent vertices of u. To update the key values, iterate through all adjacent vertices. 
	For every adjacent vertex v, if weight of edge u-v is less than the previous key value of v, update the key value as weight of u-v.

Also, the idea behind minimum spanning trees is simple: given a graph with weighted edges, find a tree of edges with the minimum total weight. 
@author: Bahaddin Arisoy, Ahmet Kazan, Hazal Suleymanoglu
*/

import java.util.*;
import java.awt.*;
import javax.swing.*;

//main class
class Prim{
	
	static int weight[][];
	
	public static void main(String args[]) {
		int v,e;
		String num;
		
		//prompt user to enter vertex number and edge number
    	num = JOptionPane.showInputDialog("Enter the number of vertices :");
    	v = Integer.parseInt(num);
    	if (v <2 || v>10){
    		JOptionPane.showMessageDialog(null,"Vertex number has to be between 2 and 10.");
    		System.exit(0);
    	}
    	int emax = (v*(v-1))/2;
    	
		num = JOptionPane.showInputDialog("Enter the number of edges :");
    	e = Integer.parseInt(num);
    	if (e <2 || e>emax){
    		JOptionPane.showMessageDialog(null,"Edge number has to be between 2 and 10.");
    		System.exit(0);
    	}
    	
    	weight =new int[v+1][v+1];
    	
    	//invoke adjPanel method to get edge weights from user
		adjPanel(v,e);


		//main algorithm goes from here.
		
		//compute paths
		int visited[]=new int[v+1];
		int distance[]=new int[v+1];    
		int path[]=new int[v+1];

		for(int i=1;i<=v;i++){
    		path[i]=0;
    		visited[i]=0;
    		distance[i]=32767;     // arbitrarily assumed no.
   		}
        
		int c=1,current=1,mincost=0;
		visited[current]=1;
		distance[current]=0;
		
		//!!!
		while(c!=v){
    		for(int i=1;i<=v;i++){
        		if(weight[current][i]!=0 && visited[i]!=1)
        			if(distance[i]>weight[current][i]){
                		distance[i]=weight[current][i];
                		path[i]=current;
                }
        	}
        
	    	int min=32767;     // arbitrarily assumed no.
	    
	        for(int i=1;i<=v;i++){
	            if(visited[i]!=1 && distance[i]<min){
	                min=distance[i];
	                current=i;
	            }   
	        }
	    	visited[current]=1;
	    	c+=1;
    	}
    	
    	//display result
    	
    	String stemp = "";
    	
		for(int i=2;i<=v;i++)
			stemp+="vertex  "+i+"  connected to  "+path[i]+"\n";
        	
        
		for(int i=1;i<=v;i++)
    		mincost+=distance[i];
    		
    	stemp+="minimum cost : "+mincost;
    	
    	JOptionPane.showMessageDialog(null,stemp);
    	
	}
	
	//method for prompting input from user using JPanel
	public static void adjPanel(int vNumber, int eNumber) {
		
    	JTextField f1 = new JTextField(5);
		JTextField f2 = new JTextField(5);
		JTextField f3 = new JTextField(5);
		JLabel l1 = new JLabel("Start Vertex: ");
		JLabel l2 = new JLabel("End Vertex: ");
		JLabel l3 = new JLabel("Edge Weight: ");
		JPanel panel = new JPanel();
		
		panel.add(l1);
		panel.add(f1);
		panel.add(l2);
		panel.add(f2);
		panel.add(l3);
		panel.add(f3);
		int result;
		String stemp="";
		String stemp2 = "";
		for(int i=1;i<=eNumber;i++) {
			stemp2 = "Please Enter Vertices and Nonnegative Edge Weights ("+i+"/"+eNumber+")";
			result = JOptionPane.showConfirmDialog(null,panel,stemp2,JOptionPane.OK_CANCEL_OPTION);
			stemp = f1.getText();
			int a = Integer.parseInt(stemp);
			stemp = f2.getText();
			int b = Integer.parseInt(stemp);
			stemp = f3.getText();
			int c = Integer.parseInt(stemp);
			weight[a][b] = c;
    		weight[b][a] = weight[a][b];
    		System.out.println ("a: "+a);
    		System.out.println ("b: "+b);
    		System.out.println ("c: "+c);
    		System.out.println ("------");
		}
		
		
    }
	
}
