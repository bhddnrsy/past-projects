 
 // @author : Bahaddin Arisoy
 
 #include<stdio.h>
 #include<stdlib.h>
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
     printf("tmb.millitm  = %d (mlliseconds)\n\n", tmb.millitm);
     }
     
     
     getch();
     return 0;
 }
 
 int fibonacci(int n) {
                   int f2=0, f1=1, fib=0, i;
                   if (n == 0 || n == 1) return n;
                   for(i=2;i<=n;i++){
                                     fib=f1+f2;
                                     f2=f1;
                                     f1=fib;
                                     }
                                     return fib; 
              }
