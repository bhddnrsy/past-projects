
 // @author : Bahaddin Arisoy

 #include<stdio.h>
 #include<stdlib.h>
 #include<time.h>
 #include<sys/timeb.h>
 
 int fibonacci(int n);
 
 int main() {
     struct timeb tmb;
     int temp, a, b;
     
     //ftime(&tmb);
     
     while (1) {
     ftime(&tmb);
     printf("Which number ? (-1 to exit)\n");
     scanf("%d",&a);
     if (a == (-1)){  
           printf("press a button to exit."); 
           break;
           }
     b = fibonacci(a);
     printf("the %d. fibonacci number is %d\n",a,b);
     printf("tmb.millitm  = %ld (mlliseconds)\n\n", tmb.millitm);
     }
     
     
     getch();
     return 0;
 }
 
 int fibonacci(int n) {
                   if (n == 0 || n == 1) return n;
                   return fibonacci(n-1)+fibonacci(n-2); 
              }
