/*
*
*	Bahaddin ARISOY
*	Bekir HIRA
*
*
*  This program implements a simple UNIX Shell.
*  It supports most of the shell commands (e.g ls, pwd, ps, firefox etc.).
*  It does not support any built-in commands such as ps_all, kill, fg, bg (except ^Z).
*  This shell also supports I/O Redirection and piping (not multiple).
*  You can terminate the shell with typing "Ctrl+D" or "exit".
*
*/


//*******Included header files***********
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>


#define MAX 128 // max number of characters


//*********Global Variables****************
char *argv[MAX]; 	//argument array
char *argv_temp[MAX]; 	//temp
char line[MAX];		//temp
int numOfArgs;		//count arguments
char* path = "/bin/";	//execv path
int result,amp;
pid_t lastPid;		//last fg process


//***************************************************************
//***************************************************************

//Parsing the given input
void setup(void) {

	int i=0;
	while(i<MAX){
    		line[i] = getchar(); //read the user line

    		if(line[i] == EOF) { //CTRL-D control
			printf("\n");
			exit(1);
    		}

    		if(line[i] == '\n') //if pressed enter
    			break;
    		i++;
  	}
  
	line[i] = '\0';
  	argv[0] = strtok(line, " \t\n");	//tokenizer
  
  	numOfArgs = 0;

  	do{ 	//tokenize all arguments
    		numOfArgs++;
    		argv[numOfArgs] = strtok(NULL," \t\n");
  	} while(argv[numOfArgs] != NULL);
  
}

//control CTRL-Z signal
void ctrlZ() {
	int k=fork();
    	if (k==0 && lastPid != '\0') {
        	kill(lastPid,SIGSTOP);
        	printf("Process %d stopped\n",lastPid);
        	kill(getpid(),SIGKILL);
    	}
    
}

//Change the directory with cd command
void changeDirectory(void) {
	int returnVal;
	char* path_;
	setenv("OLDPWD", getenv("PWD"),1);
	//printf("arg: *%s*\n",argv[1]);
	
	if(argv[1] != NULL) {	//e.g cd Desktop, cd ..
		returnVal = chdir(argv[1]);
		setenv("PWD", (char*)getcwd(NULL, 0),1);	
	}
	else {	//e.g cd
	path_ = getenv("HOME");
	returnVal = chdir(path_);
	setenv("PWD", getenv("HOME"), 1);
	}
	
	if(returnVal != 0)
		printf("Error in changing directory\n");
	else printf("Current directory: %s\n",getenv("PWD")); //display the new directory

}

//Extract a given command with symbols <,>,|
void extractCommand(char* sym) {

	int i=0, counter=0;
	for(i=0; argv[i] != NULL; i++) 
	   if(strcmp(argv[i], sym) == 0) {
		  argv[i] = NULL;
		  while(argv[i+1] != NULL) {
			argv_temp[counter] = argv[i+1];	//take the command after the symbol to argv_temp
			argv[i+1] = NULL;		//erase that command
			i++; counter++;
		  }
	   }
}

//Compare the given input with symbols >,<,|,&
char stringCompare(void) {
	int i;
  	for (i = 0; argv[i] != '\0'; i++) {
      		if (strcmp(argv[i], ">") == 0)
  	 		return argv[i][0];
      		else if (strcmp(argv[i], "<") == 0)
         		return argv[i][0];
      		else if (strcmp(argv[i], "|") == 0)
         		return argv[i][0];
      		else if (strcmp(argv[i], "&") == 0)
         		return argv[i][0];
  	}
  	return '\0';

}

//Function for connecting the standard output of one command to standard input of another command
void piping(void) {
	extractCommand("|");
	int fd[2],pid;

  	if (pipe(fd) < 0)
  	   	printf("Cannot get a pipe\n");

  	if ((pid = fork()) == 0) {	//child forks again
		lastPid = pid;
     		close(1);                 
     		dup(fd[1]);
     		close(fd[0]);
     		execvp(argv[0], argv); 
		printf("Unable to execute\n");
  	} 

  	else if (pid > 0) {
            	close(0);
            	dup(fd[0]);
            	close(fd[1]);
            	execvp(argv_temp[0], argv_temp);
		printf("Unable to execute\n");
        } 
  	else 
            	printf("Unable to fork\n");                                         
}

//Function for OutRedirection with ">"
void outRd(void) {

	extractCommand(">");
	int f,status;
	int pid = fork();
	lastPid = pid;

  	if(pid == -1) {  //error
		printf("Unable to fork\n");
		exit(1);
  	}

  	else if(pid == 0) { //child
		close(1);
		f = creat(argv_temp[0], 0644);	//create the file argv_temp[0] with permissions 
						//and use it as standard output
		char prog_[512];
		strcpy(prog_,path);	//initial path is "/bin/"
		strcat(prog_,argv[0]);	//if "ls > b.txt" is given, then path will be "/bin/ls" for command
		//printf("new path : %s",prog_);
		int res = execv(prog_, argv);	//execute command
		printf("Unable to execute\n");      
		exit(1);
  	}

  	else { //parent
		if (!amp) {	// if there's ampersand at the end of the line, parent will wait child
			printf("Waiting for child, pid = %d\n", pid);
			printf("Done %s.\n",argv[0]);
    			result = waitpid(pid, &status, 0);
		}
  	}

}


//Function for InRedirection with "<"
void inRd(void) {
  	extractCommand("<");
  	int f,status;
  	int pid = fork(); 	//parent forks
	lastPid = pid;

  	if(pid == -1) {	//error
		printf("Unable to fork\n");
		exit(1);
  	}

  	else if(pid == 0) { //child
		close(0);
		f = open(argv_temp[0], O_RDONLY);	////open the file argv_temp[0] and use it as standard input (read-only)
		char prog_[512];
		strcpy(prog_,path);
		strcat(prog_,argv[0]);		//obtain the path for the command
		printf("new path : %s",prog_);
		int res = execv(prog_, argv);	//execute command
		printf("Unable to execute\n");
		exit(1);
  	}

  	else { //parent
		if (!amp) { //if there's ampersand at the end of the line, parent will wait child
			printf("Waiting for child, pid = %d\n", pid);
			printf("Done %s.\n",argv[0]);
    			result = waitpid(pid, &status, 0);
		
		}
  	}
}

//Function for executing commands or calling "piping" function
void process(int type) {
	int status, result;
  	int pid = fork();	//parent forks
  	lastPid = pid;
 	
  	if(pid == -1) {	//error
		printf("panic: can't fork\n");
		exit(-1);
  	}
  
	else if (pid == 0) {//child process
		if (type == 0 || type == 1) {	//if argument is "&" or a single command
			char prog[512];
			strcpy(prog,path);
			strcat(prog,argv[0]);	//obtain the path
			//printf("new path : %s",prog);
			int res = execv(prog, argv);
			printf("Command %s not found\n", argv[0]);
			exit(0);
		}
	
		else if (type == 2)
			piping();	//if argument is "|" go to "piping" function to support piping.
  	}

  	else { //it's parent
		if (!amp) { 	//if there's ampersand at the end of the line, parent will wait child
			printf("Waiting for child, pid = %d\n", pid);
    			result = waitpid(pid, &status, 0);
		}
	}
}


//Function for checking if there is an ampersand at the end of the input
int ampersand(char **args) {
	int i;

  	for(i = 1; args[i] != NULL; i++) ;	//take "i" to last position

  	if(args[i-1][0] == '&') {
    		args[i-1] = NULL;		//erase the "&"
    		return 1;
  	} 

	else return 0;
  
  return 0;
}


//Main function
int main(void) {
  
	signal(20, ctrlZ);	// initialize ctrlZ signal
	
  	printf("Starting shell: \n");
  
  	while(1){

	    	printf("bbshell> ");	//command line prompt
    		
		setup();			//get input and tokenize it
 
    		if(argv[0] == NULL) continue;	//continue if only "Enter" key was pressed
    
    		if(strcmp(argv[0], "exit") == 0) exit(0);	//exit
    
    		if(strcmp(argv[0], "cd") == 0) changeDirectory();	//call "changeDirectory" function 
									//if command is "cd"
    
    		else {
			//Calls the function for redirection, piping, backgrounding or for executing commands
			switch(stringCompare()) {
  			case '<' : amp = ampersand(argv);
				   inRd();
				break;
			case '>' : amp = ampersand(argv);
				   outRd();
				break;
			case '|' : amp = ampersand(argv);
				   process(2);
				break;
			case '&' : amp = ampersand(argv);
				   process(1);
				break;
			default: process(0);
				break;
		
    			}
    		}
  	}

  	return 0;
}
