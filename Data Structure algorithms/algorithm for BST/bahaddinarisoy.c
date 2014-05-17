/*
Considering the given sequence of accesses, the final BST (i.e., the one that your algorithm
constructs as a result of the analysis of the given access pattern) should provide the minimum, nearminimum
total number of accesses. 
That is, the key of the data record that is most frequently accessed
in the given sequence is placed in the root of the BST, the keys of the ones that are accessed second
most frequently go to the children of the root (and to the nodes at the third depth level if there are more
than two of them), etc. 
In general, the less frequently a node is accessed, the deeper it should be placed in the tree.
Specifically, you will be handed in data records (84 unique negative & positive integers) in a
text file. Using this information, you are expected to
1. assign a unique key value to each data record
2. construct a BST with these keys such that this BST provides a minimum total access time.


* Currently this c code doesn't work as expected!!

* @author : Bahaddin Arisoy
*/

#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<math.h>

//structure of keys
typedef struct records records;

struct records{
       records *leftptr, *rightptr, *parentptr;
       int data, key, freq;
       };
       
records *root = NULL;
records *root2 = NULL;

records *ptr = NULL;

//prototypes
int searchArray(int value);
void addArray(int value);
records *addTree(int value, records *p);
void displayTree(records *displayer);
void findArray(int value);
void swap(int *x, int *y);
void change_nodes();


//file pointers
FILE *inpf, *outf;

int key_array[81][3];
int keyOfNode=0;

//main method
int main() {
    int x,y=0,z=20000;
    for (x=0;x<=80;x++) {
        key_array[x][0] = x+1;
        key_array[x][1] = -555555;
        key_array[x][2] = 0;
        }
    int temp=0;
    char str[7];
    int i;
    inpf = fopen("input.txt","r");
    //get values from the input.txt
    while(!feof(inpf)) {
                       fgets(str,7,inpf);
                       temp = atoi(str);
                       printf("data: %d\n",temp);
                       //search the array if the value has been found in array
                       if (searchArray(temp) != 1) {//if the number is coming for the first time!
                                             //add to array
                                             addArray(temp);
                                             
                                             }
                       else {
                            //find in the array and increase frequency
                            findArray(temp);
                            
                       }
                       //sort frequencies
                     change_nodes();  
                     
    }
    fclose(inpf);
    //add to the tree
     for(i=0;i<=80;i++) {
                     //printf("\n%d",key_array[i][1]);
                     root2=root;
                                        ptr=addTree(key_array[i][1],root2); }
    
    
    //display keys, values and frequencies
    printf ("\n\n------------------------------------\n\n");
    printf("key\tdata\tfreq\n---\t---\t---\n");
    int abcd=0;
    for(i=0;i<=80;i++) {
                       printf("%d\t%d\t%d\n",key_array[i][0],key_array[i][1],key_array[i][2]);
                       abcd+=key_array[i][2];
                       }           
    printf("\n\ntotal freq : %d\n\n",abcd);
    
    //display the tree
    printf("check output.txt \n\n");
    outf = fopen("output.txt","w");
    displayTree(root);
    fclose(outf);
    getch();
    return 0;
    
}

int searchArray(int value) {
    int i;
    for(i=0;i<=80;i++) {
                       if (value == key_array[i][1])
                          return 1;
                       }
                       return 0;
}

void addArray(int value) {
     int i=0;
     do {
         if (key_array[i][1] == -555555) {
            key_array[i][1] = value;
            key_array[i][2] = 1;
            keyOfNode = i;
            return;
            }
            i++;
            }
     while(i!=81);
     printf("There is no left array space!!");
     
}

records *addTree(int value, records *p) {
        
     if (p == NULL) {
           p = malloc(sizeof(records));
           p->data = value;
           p->freq = 1;
           p->key = keyOfNode;
           p->leftptr = p->rightptr = p->parentptr = NULL;
           if (root == NULL)
           root = p;
           return p;
           }
     
           /*
     else if (value < p->data) {
          p->leftptr = addTree(value,p->leftptr);
          p->leftptr->parentptr = p; }
     else if (value > p->data) {
          p->rightptr = addTree(value,p->rightptr);
          p->rightptr->parentptr = p; }   //this is for real bst !
       */
        // depth level olaylarýný bul hacý !
     
     
     else if (p->leftptr == NULL) {
          p->leftptr = addTree(value,p->leftptr);
          p->leftptr->parentptr = p; 
          
          }
          
     else if (p->rightptr == NULL) {
          p->rightptr = addTree(value,p->rightptr);
          p->rightptr->parentptr = p; 
          
          }
        
          
          /*
     else {
          p2 = p->leftptr;
          }
         */
          
     /*else {
          
          p->leftptr = addTree(value,p->leftptr);
          p->rightptr = addTree(value,p->rightptr);
          }
     */
     
    // return p;
}

void displayTree (records *displayer) {
     
     
     if(displayer != NULL) {
                  
                   fprintf(outf,"  %d  \n",displayer->data);
                   displayTree(displayer->leftptr);
                   //displayTree(displayer);
                   fprintf(outf,"  ");
                   displayTree(displayer->rightptr);
                   }
                   
     }
    
void findArray(int value) {
     int i,frequency;
     for(i=0;i<=80;i++) {
                       if (key_array[i][1] == value)
                       key_array[i][2]++;
     }
}

void swap(int *x, int *y) {
     int temp;
     temp = *x;
     *x = *y;
     *y = temp;
}

void change_nodes() {
     int i,j,k,min;
     int max=81;
     for(i=0;i<max-1;i++) {
     min = i;
     for(j=i+1;j<max;j++){
                          if(key_array[j][2] > key_array[min][2])
                          min = j;
                          }
                          swap(&key_array[i][2], &key_array[min][2]) ; 
                          swap(&key_array[i][1], &key_array[min][1]) ;                 
     }
     
}
