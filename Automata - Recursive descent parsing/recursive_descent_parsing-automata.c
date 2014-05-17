/*
Created a simple calculator application with Java, which gets the expression as input, 
checks the syntax for basic arithmetic operations, and gives the output to the user if the expression is acceptable or not. 
In addition, it gives the result as output. Here is the syntax grammar for our basic arithmetic operations :
	
	Expression  	-   E   ->   (E) | NON | N | ε
	Digit 			-   D   ->   “0” | “1” | “2” | “3” | “4” | “5” | “6” | “7” | “8” | “9”
	Number			-   N   ->   D | DN
	Operand			-   O   ->   “+” | “-” | “*” | “/” | “^”


	In an arithmetic expression, for example, “)” has to come after “(“. 
	Operands  “+”, ”-”, ”*”, ”/”, ”^” have to be after “)”, before “(” or between two numbers. 
	This java program below, checks these rules for basic arithmetic operations.


 * @author : Bahaddin Arisoy
 */

import java.io.*;
import java.util.*;
import java.lang.Math;

public class ParseE {

    static StringTokenizer st;
    static String curr;

    /** read the next token into curr */
    static void next() {
		try {
	    	curr=st.nextToken().intern();
	    	// use of intern() allows us to check equality with ==.
		} catch( NoSuchElementException e) {
	    	curr=null;
		}
    }

    static void error(String msg) {
		System.err.println(msg);
		System.exit(-1);
    }

    static double parseE() {
	// E -> T E1
		double x=parseT();
		return parseE1(x);
    }

    static double parseE1(double x) {
	// E1 -> T E1 | epsilon
	if (curr=="+") {
	    next();
	    double y = parseT();
	    return parseE1(x+y);
	}
	else if (curr=="-") {
	    next();
	    double y = parseT();
	    return parseE1(x-y);
	}
	else if (curr=="^") {
	    next();
	    double y = parseT();
	    return parseE1(Math.pow(x,y));
	}
	else if(curr==")" || curr=="$" ) {
	    return x;
	} else {
	    error("Error ! Unexpected :: ' "+curr+" '");
	    return x; // to make compiler happy
	}
    }

    static double parseT() {
	// T -> F T1
		double x=parseF();
		return parseT1(x);
    }

    static double parseT1(double x) {
	// T1 -> * F T1 | epsilon
	if (curr=="*") {
	    next();
	    double y=parseF();
	    return parseT1(x*y);
	}
	else if (curr=="/") {
	    next();
	    double y=parseF();
	    return parseT1(x/y);
	}
	else if(curr=="+" || curr=="-" || curr=="^" || curr==")" || curr=="$") {
	    return x;
	} else {
	    error("Error ! Unexpected : ' "+curr+" '");
	    return x; // to make compiler happy
	}
    }

    static double parseF() {
	// F -> ( E ) | a
	if( curr=="(") {
	    next();
	    double x=parseE();
	    if(curr==")") {
		next();
		return x;
	    } else {
		error ("Error ' ) ' expected.");
		return -1; // to make compiler happy
	    }
	} else try {
	    double x=Integer.valueOf(curr).intValue();
	    next();
	    return x;
	} catch(NumberFormatException e) {
	    error("Error ! Number expected.");
	    return -1; // to make compiler happy
	}
    }

    public static void main(String args []) throws IOException {

		System.out.println("Please enter the Mathematical Expression : (+,-,/,*,^)\n");

		BufferedReader in = new BufferedReader(new InputStreamReader (System.in));
		String line=in.readLine();
		st = new StringTokenizer(line+" $");
		next();
		double x=parseE();
		if(curr=="$") {
	    	System.out.println("Acceptable. Result = "+x);
		} else {
	    	error("End expected");
		}
    }
}
