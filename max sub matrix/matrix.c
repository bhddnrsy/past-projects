//  Bahaddin Arýsoy
//
//  !! Program works for 508x512 pixels.
//  
//  Find max sub-square matrix in a big 0-1 matrix.

#include<stdio.h>
#include<stdlib.h>
#define bool int
#define R 508
#define C 512

int min(int a, int b, int c)
{
  int m = a;
  if (m > b)
    m = b;
  if (m > c)
    m = c;
  return m;
}
  
void printMaxSubSquare(bool M[R][C])
{
  int i,j;
  int S[R][C];
  int max_of_s, max_i, max_j;
 
  for(i = 0; i < R; i++)
     S[i][0] = M[i][0];
 
  for(j = 0; j < C; j++)
     S[0][j] = M[0][j];
 
  for(i = 1; i < R; i++)
  {
    for(j = 1; j < C; j++)
    {
      if(M[i][j] == 1)
        S[i][j] = min(S[i][j-1], S[i-1][j], S[i-1][j-1]) + 1;
      else
        S[i][j] = 0;
    }
  }

  max_of_s = S[0][0]; max_i = 0; max_j = 0;
  for(i = 0; i < R; i++)
  {
    for(j = 0; j < C; j++)
    {
      if(max_of_s < S[i][j])
      {
         max_of_s = S[i][j];
         max_i = i;
         max_j = j;
      }
    }
  }    
  
  int temp1 = i-max_of_s, temp2 = j-max_of_s;
  
  
  printf("\nMaximum size sub-matrix is: \n");
  for(i = max_i; i > max_i - max_of_s; i--)
  {
    for(j = max_j; j > max_j - max_of_s; j--)
    {
      printf("%d ", M[i][j]);
      
    }
    printf("\n");
  }
  printf("\n\nlower right : \n");
  
  printf("(%d,%d)",temp1,temp2);
  
}    
 
int main()
{
    
  /*bool M[R][C] =  {{0, 1, 1, 0, 1},
                   {1, 1, 1, 1, 0},
                   {1, 1, 1, 1, 0},
                   {1, 1, 1, 1, 0},
                   {1, 1, 1, 1, 1},
                   {0, 0, 0, 0, 0}};*/
  bool M[R][C];
  int n, m;
        
		FILE *inp; 
		inp = fopen("squares.txt","r");
		for (n = 0; n < R; n++) {
		for (m = 0; m < C; m++) {
		    fscanf (inp, "%d", &M[n][m]);
                                  }
		}
		fclose (inp);
		
  printMaxSubSquare(M);
  getchar();
}
