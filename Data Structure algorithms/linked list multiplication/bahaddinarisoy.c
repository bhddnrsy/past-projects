//
//  Bahaddin Arısoy
//
//
//  This program gets an infinitely large number (multiplicand) and one-digit number (multiplier) from input.txt. It takes this numbers
// into linked lists and multiplies them. As a result, result number (result) gets created and displayed from output.txt. Codes have
// been written in Dev C++ 4.9.9.2 version.
//

#include<stdio.h>
#include<stdlib.h>

//Structures for multiplicand, multiplier and result.
struct mcnd {
       int data;
       struct mcnd *next;
       };
       
struct mlpr {
       int data;
       struct mlpr *next;
       };
       
struct res {
       int data;
       struct res *next;
       };
       
//Pointers for the linked lists.
struct mcnd *header_mcnd = NULL;
struct mlpr *header_mlpr = NULL;
struct res *header_res = NULL, *tail_res = NULL;

//Function prototypes.
void push_mcnd (int tmp);
void push_mlpr (int tmp2);
void multiplication (struct mcnd **, struct mlpr **);
void display ();
void printReverseForMcnd(struct mcnd *);
void printReverseForMlpr(struct mlpr *);
void printReverseForRes (struct res *);

//File pointers.
FILE *inpf, *outf;

//For the multiplication of the first number of the multiplicand.
int first_digit = 0;

int main() {
     
     int temp1, temp2;
     char c1,c2;
     
     //Firstly push zero, then other numbers in the first line of the input.txt.
     inpf = fopen("input.txt","r");
     push_mcnd(first_digit);
     while (c1 != 10) {
           
           c1 = fgetc(inpf);
           if (c1>=48 && c1<=57) {  
              temp1 = atoi(&c1);
              push_mcnd(temp1);
              }
           else {
                printf("Wrong entry!");
                getch();
                return;
                }
           }
     //Getting the second line from input.txt.
     while (!feof(inpf)) {
           c2 = fgetc(inpf);
           if(c2>=48 && c2<=57){ 
                     temp2 = atoi(&c2);
                     push_mlpr(temp2);
                     }
           }
     fclose(inpf);
     //The multiplication will be done with this function (with sending header pointers).
     multiplication(&header_mcnd, &header_mlpr);
     
     //Display the results in the output.txt.
     display();

     getch();
     return 0;
}

//Push multiplicand numbers (digit by digit) to linked list.
void push_mcnd(int tmp) {
     
     struct mcnd *n;
     n = malloc(sizeof(struct mcnd));
     n->data = tmp;
     n->next = header_mcnd;
     header_mcnd = n;
}

//Push multiplier numbers (digit by digit) to linked list.
void push_mlpr(int tmp) {
    
     struct mlpr *n;
     n = malloc(sizeof(struct mlpr));
     n->data = tmp;
     n->next = header_mlpr;
     header_mlpr = n;
}

//Multiplication function.
void multiplication (struct mcnd **mcnd_p, struct mlpr **mlpr_p) {
     
     unsigned int result,carry=0,remainder;
     
     struct mcnd *temp1;
     temp1 = *mcnd_p;
     
     struct mlpr *temp2;
     temp2 = *mlpr_p;
     
     struct res *temp3 = NULL;
     
     //In this loop, multiplicand will be taken with "temp1" and multiplier will be taken with "temp2".
     //Result will be written into linked list with the help of "temp3".
     while (temp1->next != NULL) {
           
           temp3 = malloc(sizeof(struct res));
           
           //Multiplication procedure is over here.
           remainder=0;
           result = temp1->data * temp2->data;
           result += carry;
           carry = result/10;
           remainder = result-(carry*10);
           
           temp3->data = remainder;
           temp3->next = NULL;
           //Check if first.
           if(header_res == NULL) 
               header_res = temp3; 
           else
               tail_res->next = temp3;
           tail_res = temp3;
           temp1 = temp1->next;
           }
     //If there is a remained carry after the multiplication, it will be added to the result here.      
     if (carry > 0) {
               
               temp3 = malloc(sizeof(struct res));
               temp3->data = carry;
               tail_res->next = temp3;
               tail_res = temp3;
               temp3->next = NULL;
               }
      }

//Display results.
void display() {
     
     outf = fopen("output.txt","w");
     
     struct mcnd *n1;
     n1 = header_mcnd;
     fprintf(outf,"Multiplicand : ");
     printReverseForMcnd(n1);
     
     
     fprintf(outf,"\n");
     
     struct mlpr *n2;
     n2 = header_mlpr;
     fprintf(outf,"Multiplier : ");
     printReverseForMlpr(n2);
               
     fprintf(outf,"\n");

     struct res *n3;
     n3 = header_res;
     fprintf(outf,"Result : ");
     printReverseForRes(n3) ;  
     
     fclose(outf);
     printf("Please check output.txt");
}

//Recursive functions for printing linked lists reverse.

void printReverseForMcnd(struct mcnd *head) {
     if(head != NULL) {
             printReverseForMcnd(head->next);
             fprintf(outf,"%d",head->data);
             }
     }
void printReverseForMlpr(struct mlpr *head){
     if(head != NULL) {
             printReverseForMlpr(head->next);
             fprintf(outf,"%d",head->data);
             }
     }
void printReverseForRes(struct res *head){
     if(head != NULL) {
             printReverseForRes(head->next);
             fprintf(outf,"%d",head->data);
             }
     }


