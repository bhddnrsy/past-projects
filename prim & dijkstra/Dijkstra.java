/*
Algorithm
1. Mark the distances from where you are and add them to the temporary boxes.
2. Hop to the next vertex with the lowest temporary number (even if it doesn't connect to you) and make its lowest temporary number permanent.
3. Repeat this process.
Main idea of the algorithm is to the find the shortest path between two points in a weighted graph.
The Shortest Path Problem : 
The shortest path problem is the problem of finding a path between two vertices (or nodes) in a graph such that 
the sum of the weights of its constituent edges is minimized.

@author: Bahaddin Arisoy, Ahmet Kazan, Hazal Suleymanoglu
*/

import java.util.PriorityQueue;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.awt.*;
import javax.swing.*;

//vertex creation
class Vertex implements Comparable<Vertex>
{
    public final String name;
    public Edge[] adjacencies;
    public double minDistance = Double.POSITIVE_INFINITY;
    public Vertex previous;
    public Vertex(String argName) { name = argName; }
    public String toString() { return name; }
    public int compareTo(Vertex other)
    {
        return Double.compare(minDistance, other.minDistance);
    }

}

//edge creation
class Edge
{
    public final Vertex target;
    public final double weight;
    public Edge(Vertex argTarget, double argWeight)
    { target = argTarget; weight = argWeight; }
}

//main class for implementing Dijkstra's Algorithm
public class Dijkstra {
	
	//method for computing paths from start(source) node to any other node
    public static void computePaths(Vertex source){
    	
        source.minDistance = 0.;
        PriorityQueue<Vertex> vertexQueue = new PriorityQueue<Vertex>();
		vertexQueue.add(source);

		while (!vertexQueue.isEmpty()) {
	    	Vertex u = vertexQueue.poll();

            // Visit each edge exiting u
            for (Edge e : u.adjacencies)
            {
                Vertex v = e.target;
                double weight = e.weight;
                double distanceThroughU = u.minDistance + weight;
                
				if (distanceThroughU < v.minDistance) {
				    vertexQueue.remove(v);
		
				    v.minDistance = distanceThroughU ;
				    v.previous = u;
				    vertexQueue.add(v);
				}
            }
        }
    }

	//method for calculating the shortest path from start node to target node
    public static List<Vertex> getShortestPathTo(Vertex target)
    {
        List<Vertex> path = new ArrayList<Vertex>();
        for (Vertex vertex = target; vertex != null; vertex = vertex.previous)
            path.add(vertex);

        Collections.reverse(path);
        return path;
    }

	//this list is for holding the weights of edges and using it in main method
	static List<JTextField> fields = new ArrayList<JTextField>();

    public static void main(String[] args)
    {
    	List<Vertex> vertices = new ArrayList<Vertex>();
    	List<Edge> edges = new ArrayList<Edge>();
    	
    	String num;
    	int vertexNum;
    	
    	//prompt user to enter vertex number
    	num = JOptionPane.showInputDialog("Enter the number of vertices :");
    	vertexNum = Integer.parseInt(num);
    	if (vertexNum <2 || vertexNum>10){
    		JOptionPane.showMessageDialog(null,"Vertex number has to be between 2 and 10.");
    		System.exit(0);
    	}
    	
    	double[] weights = new double[(vertexNum*(vertexNum-1))];
    	
    	adjPanel(vertexNum);
    	
    	//get all the weights from textfield to array
    	for (int i = 0; i<weights.length; i++){
    		weights[i] = Double.parseDouble(fields.get(i).getText());
    	}
    	
    	String s;
    	//add vertices to arraylist
    	for(int i=0; i<vertexNum; i++){
    		s="v" + (i+1);
    		vertices.add(new Vertex(s));
    	}
    	
    	//add edges to arraylist and link vertices with edges
    	Edge[] edgeArray;
    	int z = 0,y=0, t;
    	for(int i=0; i<vertexNum; i++){
    		t=0;
    		for(int j=0; j<vertexNum; j++){
    			if(i+1 == j+1) {
    				continue;
    			}
    			if (weights[z] != 0){
    				edges.add(new Edge(vertices.get(j),weights[z]));
    				t++;
    				System.out.println ("t="+t);
    			}
    			z++;
    			System.out.println ("z="+z);
    		}
    		edgeArray = new Edge[t];
    		for(int tt=0;tt<t;tt++){
    			edgeArray[tt]=edges.get(y);
    			y++;
    			System.out.println ("edgeArray["+tt+"]="+edgeArray[tt].weight);
    		}
    		vertices.get(i).adjacencies = edgeArray;
    	}
    	
    	//-----for debugging----
    	for (int i = 0; i<vertices.size(); i++){
    		System.out.println ("vertices: "+vertices.get(i).adjacencies);
    	}
    	System.out.println ("vertices : "+vertices);
    	for (int i = 0; i<weights.length; i++){
    		System.out.println ("weights["+i+"]= "+weights[i]);
    	}
    	for (int i = 0; i<edges.size(); i++){
    		System.out.println ("edges: "+edges.get(i).target);
    		System.out.println ("weight of edge : "+edges.get(i).weight);
    	}
    	for(int i=0; i<20; i++){
    		System.out.print("-");
    	}
    	//-----for debugging----
    	
    	//compute all paths from starting node
        computePaths(vertices.get(0));
        
        //get the shortest path to all nodes
        String result="";
        for (Vertex v : vertices)
		{
			result += "\nDistance to " + v + ": " + v.minDistance;
		    List<Vertex> path = getShortestPathTo(v);
		    result += "\nPath: " + path + "\n";
		}
		
		//show result to user
		JOptionPane.showMessageDialog(null,result);
    }
    
    //method for prompting input from user using JPanel
    public static void adjPanel(int vNumber) {
    	int temp = 1;
    	String s;
    	
    	JPanel jp3 = new JPanel();
    	jp3.setLayout(new BorderLayout());
    	
    	JPanel jp2 = new JPanel();
    	jp2.add(new JLabel("Enter 0 if no adjacency."));
    	
    	JPanel jp = new JPanel(new GridLayout(vNumber,2*(vNumber-1),10,10));
    	
    	int i=1,j=1;
    	while(temp <= vNumber*(vNumber-1)){
    		if (i==j) j++;
    		s=(i) + " - " + (j); 
    		fields.add(new JTextField(5));
    		jp.add(new JLabel(s));
      		jp.add(fields.get(temp-1));
      		j++;
      		
      		if (temp%(vNumber-1) == 0) {
      			i++; j=1;
      		}
      		temp++;
    	}
    	
    	jp3.add(jp2,BorderLayout.NORTH);
    	jp3.add(jp,BorderLayout.CENTER);
    	
    	int result = JOptionPane.showConfirmDialog(null,jp3,"Please Enter Nonnegative Edge Weights",JOptionPane.OK_CANCEL_OPTION);
    }
}
