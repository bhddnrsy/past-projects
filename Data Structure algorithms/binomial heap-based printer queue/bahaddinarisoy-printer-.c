/*
you are required to write a program which controls the printer queue in the faculty
laboratory. The laboratory printer users send print jobs to the printer queue, and your algorithm assigns
priorities to these jobs and inserts the job to the queue according to this priority.
The arrival time for the print job, the number of pages for the corresponding job, and the group-type of
the print job owner are given in an input file. The first column in the file is the arrival time (in seconds) of the
request for the print job. The second column is the number of pages requested to be printed for that job. The
third column is the group-type of the user requesting the print job.
There are four different group types defined for the printer: student, instructor, assistant, secretary, for
which the priorities are assigned, respectively. That is, the student group has the highest where the secretary
group has the lowest priority.
Another prioritization is assigned according to the number of pages of the print job. The job with
fewer number of pages to be printed has a higher priority.

@author : Bahaddin Arisoy
*/

#include<stdio.h>
#include<stdlib.h>
#include<limits.h>
#define MAX INT_MAX

typedef struct BH_Header BH_Header;
struct BH_Header{
       BH_Header *first, *p, *child, *sibling;
       int key, degree;
       };
BH_Header *BH_header_ = NULL;
BH_Header *x_=NULL,*y_=NULL;

BH_Header *BH_Create();
BH_Header *BH_Find_Min(BH_Header *BH_hdr);
BH_Header *BH_Insert(BH_Header *BH_hdr, BH_Header *x);
BH_Header *BH_Merge(BH_Header *BH1_hdr, BH_Header *BH2_hdr);
void Get_a_BT_k(BH_Header *y,BH_Header *z);
void BH_Delete_Min(BH_Header *BH_hdr);
BH_Header *Merge_Root_Lists(BH_Header *a, BH_Header *b);
BH_Header *Merge_Sort(BH_Header *c, int len);

FILE *inpf;
int array [100][5];
int data_key2=0;
int data_key;

int main(void) {
    
    char temp[10];
    int arrtime=0, pages=0;
    inpf = fopen("input.txt","r");
    int c1=0, c2=0, i=0, job=1;
    printf("arrtime\tpages\ttype\n");
    printf("-------\t-------\t-------\n");
    while (!feof(inpf)) {
          fscanf(inpf,"%d\t%d\t%s",&arrtime,&pages,temp);
          printf("%d\t%d\t%s\n",arrtime,pages,temp);
          
          array[i][0]=job;
          array[i][1]=arrtime;
          array[i][2]=pages;
          
          if (pages <= 0) {
                    printf("\n\nPage number can't be zero or less !");
                    getch();
                    return 0;
                    }
          
          if (pages < 50) {
             if (temp[1]==116)
             array[i][3]=1;
             else if (temp[1]==110)
             array[i][3]=2;
             else if (temp[1]==115)
             array[i][3]=3;
             else if (temp[1]==101)
             array[i][3]=4;
          
             else {
             printf("Wrong type!");
             getch();
             return 0;
             }
             data_key=((array[i][3])*(1000000))+((array[i][2])*(10000))+((array[i][1]));
             array[i][4]=data_key;
          }
          
          else {
               if (temp[1]==116)
               array[i][3]=5;
               else if (temp[1]==110)
               array[i][3]=6;
               else if (temp[1]==115)
               array[i][3]=7;
               else if (temp[1]==101)
               array[i][3]=8;
          
               else {
               printf("Wrong type!");
               getch();
               return 0;
               }
               data_key=((array[i][2])*(1000000))+((array[i][3])*(10000))+((array[i][1]));
               array[i][4]=data_key;
               }
          
          i++;
          job++;
          }
          //-----
    printf("\n-------------------------\n\n");
    printf("job\tarrtime\tpages\ttype\tkey\n");
    printf("-------\t-------\t-------\t-------\t-------\n");
    for(c1=0;c1<i;c1++) {
                       printf("%d\t%d\t%d\t%d\t%d\n",array[c1][0],array[c1][1],
                       array[c1][2],array[c1][3],array[c1][4]);
                       }   
          //-----
          /*
    BH_header_=(BH_Header*)malloc(sizeof(BH_Header));
    BH_header_->first = NULL;
    BH_header_->p = NULL;
    BH_header_->child = NULL;
    BH_header_->sibling = NULL;
    BH_header_->degree = 0;
    BH_header_->key = 0;
    
    int tmp1=0;
    while (array[tmp1][0] != 0) {
          data_key2 = array[tmp1][4];
          printf("\n%d",data_key2);
          y_=BH_Insert(BH_header_, x_);
          printf("\n/// y:%d ///\n",y_->key);
          tmp1++;
          
          }
    */
    printf("\nbitti");
                                     
    fclose(inpf);
    getch();
    return 0;
}

//---------------------------------------------------------------------------------------------------

BH_Header *BH_Create() {
          BH_Header *BH_hdr;
          BH_hdr = (BH_Header*)malloc(sizeof(BH_Header));
          BH_hdr->first=NULL;
          return BH_hdr;
          }

BH_Header *BH_Find_Min(BH_Header *BH_hdr) {
     BH_Header *x=NULL, *y=NULL;
     x = BH_hdr->first;
     int min = MAX;
     while(x != NULL) {
             if((x->key)<min) {
                              min = x->key;
                              y = x;
                              }
             x = x->sibling;
             }
             return y;
     }

BH_Header *BH_Insert(BH_Header *BH_hdr, BH_Header *x){
     printf("\n%d",data_key2);
     BH_Header *BH1_hdr = BH_Create();
     printf("\n%d",data_key2);
     x=(BH_Header *)malloc(sizeof(BH_Header));
     printf("\n%d",data_key2);
     x->sibling = NULL;
    printf("\n%d",data_key2);
     x->p = NULL;
     printf("\n%d",data_key2);
     x->child = NULL;
     printf("\n%d",data_key2);
     x->degree=0;
     printf("\n%d",data_key2);
     x->key = data_key2;
     printf("\n%d",data_key2);
     BH1_hdr->first = x;
     printf("\n%d",data_key2);
     BH_hdr = BH_Merge(BH1_hdr,BH_hdr);
     return BH_hdr;
     }
     
BH_Header *BH_Merge(BH_Header *BH1_hdr, BH_Header *BH2_hdr) {
          //printf("\nmerge1\n");
          BH_Header *x=NULL, *r=NULL;
          //printf("merge2\n");
          BH_Header *BH_hdr = BH_Create();
          //printf("merge3\n");
          //heaplerin uzunluklarýný hesapla,sort et
          int len1=0,len2=0;
          BH_Header *tmp1=NULL,*tmp2=NULL;
          //printf("merge4\n");
          tmp1 = BH1_hdr;
          tmp2 = BH2_hdr;
          while (tmp1 !=NULL) {
          len1++;
          tmp1=tmp1->sibling;
          }
          printf("len1:%d\n",len1);
          while (tmp2 !=NULL) {
          len2++;
          tmp2=tmp2->sibling;
          }
          printf("len2:%d\n",len1);
          printf("merge5\n");
          BH1_hdr=Merge_Sort(BH1_hdr,len1);
          printf("merge6\n");
          BH2_hdr=Merge_Sort(BH2_hdr,len2);
          printf("merge7\n");
          //merge sorted heaps
          BH_hdr->first = Merge_Root_Lists(BH1_hdr, BH2_hdr);//mergesort?
          printf("merge8\n");
          if(BH_hdr->first == NULL) return BH_hdr->first;
          BH_Header *q=NULL;
          x=BH_hdr->first;
          r=x->sibling;
          while(r!=NULL) 
                         if(r->degree != x->degree || r->sibling != NULL
                         && r->sibling->degree == x->degree) {
                                               q=x;
                                               x=r;
                                               }
                         else if(x->key <= r->key) {
                              x->sibling = r->sibling;
                              Get_a_BT_k(r,x);
                              }
                         else {
                              if(q==NULL)
                                         BH_hdr->first = r;
                              else
                                  q->sibling = r;
                              
                              Get_a_BT_k(x,r);
                              x=r;
                              }
                         r = x->sibling;//??while?
                         
          return BH_hdr;
          }

void Get_a_BT_k(BH_Header *y,BH_Header *z) {
     y->p = z;
     y->sibling = z->child;
     z->child = y;
     (z->degree)++;
     }

void BH_Delete_Min(BH_Header *BH_hdr) {
     BH_Header *x = BH_Find_Min(BH_hdr);
     //remove x
     BH_Header *BH1_hdr = BH_Create();
     //establish a LL of x's children
     //BH1_hdr->first = pointer to node with degree = 0
     BH_hdr = BH_Merge(BH1_hdr,BH_hdr); 
     }

BH_Header *Merge_Root_Lists(BH_Header *a, BH_Header *b) {
         
          BH_Header *c = BH_Create();
          BH_Header *z = BH_Create();
          c=z;
          printf("%d\n",MAX);
          printf("rootlist1\n");
          do{
              if(a->key <= b->key) {
                        printf("rootlist2\n");
                        c->sibling=a;
                        c=a;
                        a=a->sibling;
                        }
              else {
                   printf("rootlist3\n");
                   c->sibling=b;
                   c=b;
                   b=b->sibling;
                   }
                   printf("rootlist4\n");
          }
          
          while (a != NULL && b != NULL);
          printf("rootlist5\n");
          return z->sibling;
          z->sibling = z;
}

BH_Header *Merge_Sort(BH_Header *c,int len) {
          BH_Header *a=NULL,*b=NULL,*z=NULL;
          int i;
          z=c;
          printf("mergesort1\n");
          if(c->sibling == NULL) {
                        printf("****\n");
                        return c;
                        }
          
          else {
               printf("----");
               a=c;
               for(i=1;i<len/2;i++) 
                                    c=c->sibling;
               b=c->sibling;
               c->sibling=z;
               printf("mergesort2\n");
               return Merge_Root_Lists(Merge_Sort(a,len/2),Merge_Sort(b,len-(len/2)));
               }
}
