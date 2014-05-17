-	In this program, we tried to implement a basic UNIX shell with C language.
-	Here are the methods that we constructed in our program:
	
	void setup(void) 			// for parsing the given input string
	void ctrlZ()				// for controlling the CTRL+Z signal
	void changeDirectory(void)		// for changing the working directory
	void extractCommand(char*)		// for extracting the given symbols (< , > , | )
	char stringCompare(void)		// for comparing the given symbols ( < , > , | , & )
	void piping(void)			// for piping the given commands
	void outRd(void)			// for supporting the output redirection with “>”
	void inRd(void)				// for supporting the input redirection with “<”
	void process(int)			// for executing the given commands
	int ampersand(char **)			// for checking for the ampersand ( & )
	int main(void)				// main function


-	In main, firstly we are printing a command prompt “bbshell>” to wait for an input from the user in an inifinite while loop.
-	We are calling setup() function to get the input and parse it with delimiting whitespaces, tabs or linefeeds. To manage parsing, we are using strtok() function of C library.
-	We took these parsed strings to argv*[] array which is global.
-	After that, we firstly checking these strings with comparing them with “exit” or “cd”.
-	To change the directory if given, we call the changeDirectory() function.
-	After these, we are comparing these strings if they are shell commands or symbols which may be “<” , “>” , “ | ” or “ & ” .
-	If there is an ampersand (&) at the end of the given input, this means that we have to execute that command at the background (Parent process have to wait for child process to finish its execution). 
-	We are calling ampersand() function in main function to understand if this command/commands have to be executed at the background.
-	To achieve an input redirection, we are calling inRd() function.
-	To achieve an output redirection, we are calling outRd() function.
-	In these redirection functions, we only used execv() function to execute given commands.
-	To achieve a piping, we are calling piping() function in the process(). In this function, we are connecting the standart input output of the first command to standard input of the second command with using dup().
-	Lastly, we are using a function called process() to achieve a given command without any redirections. It uses fork() function to create child processes.
	



Structural Deficiencies

-	This shell does not provide a full absolute path command with execl().
-	It handles a process to go foreground or background but it does not have a history of these jobs because of not having a data structure for these jobs.
-	It does not support internal commands such as ps_all, kill, bg, fg (except ^Z).
-	It does not support multiple redirectioning or piping.
-	It does not support append (>>)  token for redirection.
