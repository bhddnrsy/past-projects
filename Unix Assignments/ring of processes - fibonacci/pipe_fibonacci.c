/*
* Calculate the first n Fibonacci sequence program entry 
* by Bahaddin Arisoy and Hazal Suleymanoglu
*/

#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include <sys/wait.h>

int main()
{
	int fd[2];
	int n,i=1;
	int error;
	printf("Output of the first n Fibonacci sequence entries, enter n:");
	scanf("%d",&n);
	
	//Check the input n
	if(n>80){
		printf("The number n is too big!\n");
		return 1;
	}
	if(n<=0){
		printf("The number n cannot be negative!\n");
		return 1;
	}
	
	n++;
	long fib[n+2];
	fib[0]=0;
	fib[1]=1;
	pid_t childpid=0,f;
	f=getpid();

	if(pipe(fd)==-1){
		perror("New pipeline error");
		return 1;
	}
	if((dup2(fd[0],STDIN_FILENO)==-1)||(dup2(fd[1],STDOUT_FILENO)==-1)){
		perror("Pipeline connection error");
		return 1;
	}
	if((close(fd[0])==-1)||(close(fd[1])==-1)){
		perror("Closing pipeline error");
		return 1;
	}

	//Use for statement creation process ring
	for(i=1;i<n;i++){
		if(pipe(fd)==-1){
			perror("Pipeline error");
			return 1;
		}
		if((childpid=fork())==-1){
			perror("Process error");
			return 1;
		}
		if(childpid>0){
			error=dup2(fd[1],STDOUT_FILENO);
		}
		else if(!childpid){
			error=dup2(fd[0],STDIN_FILENO);
		}
		if((close(fd[0])==-1)||(close(fd[1])==-1)){
			perror("Closing pipe error");
			return 1;
		}
		if(f==getpid())	{
			write(STDOUT_FILENO,fib,sizeof(fib));
			fprintf(stderr,"from process %d with ID %ld and parent ID %ld : %ld\n",i, (long)getpid(), (long)getppid(), fib[i]);
		}
		else if(childpid){
			read(STDIN_FILENO,fib,sizeof(fib));
			fib[i]=fib[i-2]+fib[i-1];
			write(STDOUT_FILENO,fib,sizeof(fib));
			fprintf(stderr,"from process %d with ID %ld and parent ID %ld : %ld\n",i, (long)getpid(), (long)getppid(), fib[i]);
			}
		if(childpid) {break;}
	}	

	/*Finally, a process of calculating the final one, 
	and the results transmitted to the first process.*/
	if(childpid==0){
		read(STDIN_FILENO,fib,sizeof(fib));
		fib[i]=fib[i-2]+fib[i-1];
		write(STDOUT_FILENO,fib,sizeof(fib));
		return 1;
	}
	else {wait(NULL);}
	if(f==getpid()){
		read(STDIN_FILENO,fib,sizeof(fib));
	}
	return 0;
}

