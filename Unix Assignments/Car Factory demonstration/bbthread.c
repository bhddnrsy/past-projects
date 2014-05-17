//
//	Bekir HIRA
//	Bahaddin ARISOY
//
//****************************************************
//
//	This program demonstrates a car factory with 4-type technicians and several jobs
// such as chassis,tires,seats,engine,top cover and painting.
//	There are some deficiencies at the program.
//
//

//------------Includes-------------
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h> 

//-------------------Global Variables-----------------------
FILE  *fin,*fout; // file input & output 
int typeA,typeB,typeC,typeD,simTime; // number of technicians and total simulation time
int chassisPerDay,paintingPerDay,tiresPerDay,seatsPerDay,enginesPerDay,cartopsPerDay; // jobs per day
int numOfThreads,totalCarNum,timeCount; // basic counters
int num_ch=0,num_ti=0,num_se=0,num_en=0,num_tc=0,num_pn=0,tempa,tempb,tempc,tempd; // several counters

//--------------------Mutexes----------------------------
pthread_mutex_t ch_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t ti_se_en_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t tc_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t pn_mutex = PTHREAD_MUTEX_INITIALIZER;


//----------Function Prototypes--------------
void *chassis(void *);
void *tires(void *);
void *seats(void *);
void *engine(void *);
void *topcover(void *);
void *painting(void *);
void getInput();

typedef enum {false,true} bool; // for boolean type


//-------------Structs--------------------
struct thread_data // for thread (id and type)
{
	int thread_id;
	char type;
};

struct car_data // for the car data
{	
	int car_id;
	bool chassis;
	bool tires;
	bool seats;
	bool engine;
	bool cover;
	bool paint;
	bool done;
};
struct car_data *car;

int main()
{
	    fout=fopen("output.txt","w"); // create the output file as "output.txt"
	    if( fin==NULL ){
		       puts("Cannot open file!\n");
	    }
	    fprintf( fout, "Technician_ID\tCar_ID\tOperation\tSimulation_Day\n"); 
	    
	    int rc,t,temp;
	    void *status;
	    totalCarNum = 0;
	    
	    
	    getInput(); // get input from the "input.txt"
		
		// define threads and attributes
	    pthread_t threads[numOfThreads];
	    pthread_attr_t attr;
	
		// thread arrays for different types of threads
	    struct thread_data thread_A_array[typeA];
	    struct thread_data thread_B_array[typeB];
	    struct thread_data thread_C_array[typeC];
	    struct thread_data thread_D_array[typeD];

	    // Initialize and set thread detached attribute 
	    pthread_attr_init(&attr);
	    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);

	    temp = 0;
	    tempb = 0;
		
		// execution of chassis with type B threads.
	    for(t=0;t<typeB;t++) {
    	                     thread_B_array[t].thread_id = t;
    	                     thread_B_array[t].type = 'B';
    	                     printf("Creating thread B (%d)\n", t);
    	                     rc = pthread_create(&threads[temp], &attr, chassis, (void *) 
    	                        &thread_B_array[t]); // send thread to the function
    	                     if (rc) {
    	                             printf("ERROR; return code from pthread_create() is %d\n", rc);
    	                             exit(-1);
    	                     }
				 temp++;
	    }
		
		tempa = 0;
	    // execution of tires with type A threads.
		for(t=0;t<typeA;t++) {
	                         thread_A_array[t].thread_id = t;
	                         thread_A_array[t].type = 'A';
	                         printf("Creating thread A (%d)\n", t);
	                         rc = pthread_create(&threads[temp], &attr, tires, (void *) 
	                            &thread_A_array[t]); // send thread to the function
	                         if (rc) {
	                                 printf("ERROR; return code from pthread_create() is %d\n", rc);
	                                 exit(-1);
	                         }
				 
				 temp++;
	    }
		
		tempc = 0;
		// execution of seats with type C threads.
	    for(t=0;t<typeC;t++) {
	                         thread_C_array[t].thread_id = t;
	                         thread_C_array[t].type = 'C';
	                         printf("Creating thread C (%d)\n", t);
	                         rc = pthread_create(&threads[temp], &attr, seats, (void *) 
	                            &thread_C_array[t]); // send thread to the function
	                         if (rc) {
	                                 printf("ERROR; return code from pthread_create() is %d\n", rc);
	                                 exit(-1);
	                         }
				 temp++;
	    }
		
		tempd = 0;
	    // execution of engine with type D threads.
		for(t=0;t<typeD;t++) {
	                         thread_D_array[t].thread_id = t;
	                         thread_D_array[t].type = 'D';
	                         printf("Creating thread D (%d)\n", t);
	                         rc = pthread_create(&threads[temp], &attr, engine, (void *) 
	                            &thread_D_array[t]); // send thread to the function
	                         if (rc) {
	                                 printf("ERROR; return code from pthread_create() is %d\n", rc);
	                                 exit(-1);
	                         }
				 temp++;
	    }
	

   	// free attribute and wait for the other threads
   	pthread_attr_destroy(&attr);
  	for(t=0; t<numOfThreads; t++) {
   	   rc = pthread_join(threads[t], &status);
   	   if (rc) {
   	      printf("ERROR; return code from pthread_join() is %d\n", rc);
   	      exit(-1);
   	      }
   	   printf("Main: completed join with thread %ld having a status of %ld\n",t,(long)status);
   	}
  
    	pthread_exit(NULL);  
    	fclose(fout);
    	return 0;
	
}


void getInput() {
           
           fin=fopen("input.txt","r"); // open "input.txt"
	       if( fin==NULL ){
		       puts("Cannot open file!\n");
	       }
	
		   //scan for the inputs and assign
	       fscanf(fin,"%d %d %d %d %d %d %d %d %d %d %d",
		     &typeA,&typeB,&typeC,&typeD,&simTime,&chassisPerDay,
		     &paintingPerDay,&tiresPerDay,&seatsPerDay,&enginesPerDay,&cartopsPerDay);
           numOfThreads = typeA + typeB + typeC + typeD; // total number of threads calculated here
 	       fclose(fin);

	       puts("Data : "); // for just checking from the terminal
	       printf("\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n\n",typeA,typeB,typeC,typeD,simTime,chassisPerDay,
		     paintingPerDay,tiresPerDay,seatsPerDay,enginesPerDay,cartopsPerDay);
           
}

void *chassis(void *threadarg){
	
	int taskid,i;
   	double result = 0.0;	
   	char *hello_msg, techtype;
	bool state;
   	struct thread_data *my_data;

	pthread_mutex_lock(&ch_mutex); //every thread here have to lock the other types of threads
	num_ch++;
	if(num_ch==1) pthread_mutex_lock(&ti_se_en_mutex);
	pthread_mutex_unlock(&ch_mutex);
	
   	sleep(1);
   	my_data = (struct thread_data *) threadarg;
   	taskid = my_data->thread_id; // these variables are for using in fprintf function
   	techtype = my_data->type;

	pthread_mutex_lock(&ch_mutex);	
	car = (struct car_data *) malloc(sizeof(car));
	totalCarNum++; // increase the total car number
	car->car_id = totalCarNum;
	car->chassis = true; // chassis have been done
	fprintf(fout,"Type %c - %d\t%d\tchassis\t\t1\n",techtype,taskid,car->car_id); // display
	pthread_mutex_unlock(&ch_mutex);
	/*
   	for (i=0; i<1000000; i++)
   	{
   	   result = result + i*i;
   	}*/
   	printf("CHASSIS ::  Thread %d:  Type : %c  Self : %d\n", taskid, techtype, (unsigned int)pthread_self());	
	num_ch--;
   	pthread_mutex_unlock(&ti_se_en_mutex);
   	pthread_exit((void*) threadarg);
}

void *tires(void *threadarg) {
	
	int taskid,i;
   	double result = 0.0;
   	char *hello_msg, techtype;
   	struct thread_data *my_data;

   	pthread_mutex_lock(&ti_se_en_mutex);//every thread here have to lock the other types of threads
	num_ti++;
	if(num_ti==1) pthread_mutex_unlock(&tc_mutex);
	pthread_mutex_unlock(&ti_se_en_mutex);

   	sleep(1);
   	my_data = (struct thread_data *) threadarg;
   	taskid = my_data->thread_id;// these variables are for using in fprintf function
   	techtype = my_data->type;

	pthread_mutex_lock(&ti_se_en_mutex);	
	//car = (struct car_data *) malloc(sizeof(struct car));
	//totalCarNum++;
	tempa++;
	car->car_id = tempa;
	car->tires = true; // tires have been done
	fprintf(fout,"Type %c - %d\t%d\ttires\t\t1\n",techtype,taskid,car->car_id);
	pthread_mutex_unlock(&ti_se_en_mutex);	

   	for (i=0; i<1000000; i++)
   	{
      	result = result + i*i;
   	}
   	printf("TIRES ::  Thread %d:  Type : %c  Self : %d\n", taskid, techtype, (unsigned int)pthread_self());
   	//pthread_mutex_unlock(&tc_mutex);
	num_ti--;
   	pthread_mutex_unlock(&tc_mutex);
   	pthread_exit((void*) threadarg);

}

void *seats(void *threadarg)
{
   	int taskid,i;
   	double result = 0.0;
   	char *hello_msg, techtype;
   	struct thread_data *my_data;
   	pthread_mutex_lock(&tc_mutex);
   	pthread_mutex_unlock(&tc_mutex);
   	sleep(1);
   	my_data = (struct thread_data *) threadarg;
   	taskid = my_data->thread_id;
   	techtype = my_data->type;

	pthread_mutex_lock(&ti_se_en_mutex);	
	//car = (struct car_data *) malloc(sizeof(struct car));
	//totalCarNum++;
	tempc++;
	car->car_id = tempc;
	car->seats = true;
	fprintf(fout,"Type %c - %d\t%d\tseats\t\t1\n",techtype,taskid,car->car_id);
	pthread_mutex_unlock(&ti_se_en_mutex);	

   	for (i=0; i<1000000; i++)
   	{
   	   result = result + i*i;
   	}
   	printf("SEATS ::  Thread %d:  Type : %c  Self : %d\n", taskid, techtype, (unsigned int)pthread_self());
   	//pthread_mutex_unlock(&tc_mutex);
   	pthread_exit((void*) threadarg);
}

void *engine(void *threadarg) {
	
	int taskid,i;
   	double result = 0.0;
   	char *hello_msg, techtype;
   	struct thread_data *my_data;
   	//pthread_mutex_lock(&tc_mutex);
   	sleep(1);
   	my_data = (struct thread_data *) threadarg;
   	taskid = my_data->thread_id;
   	techtype = my_data->type;

	pthread_mutex_lock(&ti_se_en_mutex);	
	//car = (struct car_data *) malloc(sizeof(struct car));
	//totalCarNum++;
	tempd++;
	car->car_id = tempd;
	car->engine = true;
	fprintf(fout,"Type %c - %d\t%d\tengine\t\t1\n",techtype,taskid,car->car_id);
	pthread_mutex_unlock(&ti_se_en_mutex);	

   	for (i=0; i<1000000; i++)
   	{
      	result = result + i*i;
   	}
   	printf("ENGINE ::  Thread %d:  Type : %c  Self : %d\n", taskid, techtype, (unsigned int)pthread_self());
   	//pthread_mutex_unlock(&tc_mutex);
   	pthread_exit((void*) threadarg);

}

void *topcover(void *threadarg) {
	
	int taskid,i;
   	double result = 0.0;
   	char *hello_msg, techtype;
   	struct thread_data *my_data;
   	//pthread_mutex_lock(&tc_mutex);
   	sleep(1);
   	my_data = (struct thread_data *) threadarg;
   	taskid = my_data->thread_id;
   	techtype = my_data->type;

	pthread_mutex_lock(&tc_mutex);	
	//car = (struct car_data *) malloc(sizeof(struct car));
	//totalCarNum++;
	//tempx++;
	//car->car_id = tempx;
	//car->cover = true;
	//fprintf(fout,"Type %c - %d\t%d\ttop cover\t\t1\n",techtype,taskid,car->car_id);
	pthread_mutex_unlock(&tc_mutex);	

   	for (i=0; i<1000000; i++)
   	{
      	result = result + i*i;
   	}
   	printf("TOP COVER ::  Thread %d:  Type : %c  Self : %d\n", taskid, techtype, (unsigned int)pthread_self());
   	//pthread_mutex_unlock(&tc_mutex);
   	pthread_exit((void*) threadarg);

}

void *painting(void *threadarg) {
	
	int taskid,i;
   	double result = 0.0;
   	char *hello_msg, techtype;
   	struct thread_data *my_data;
   	//pthread_mutex_lock(&tc_mutex);
   	sleep(1);
   	my_data = (struct thread_data *) threadarg;
   	taskid = my_data->thread_id;
   	techtype = my_data->type;

	pthread_mutex_lock(&pn_mutex);	
	//car = (struct car_data *) malloc(sizeof(struct car));
	//totalCarNum++;
	//tempx++;
	//car->car_id = tempx;
	//car->paint = true;
	//fprintf(fout,"Type %c - %d\t%d\tpainting\t\t1\n",techtype,taskid,car->car_id);
	pthread_mutex_unlock(&pn_mutex);	

   	for (i=0; i<1000000; i++)
   	{
      	result = result + i*i;
   	}
   	printf("PAINTING ::  Thread %d:  Type : %c  Self : %d\n", taskid, techtype, (unsigned int)pthread_self());
   	//pthread_mutex_unlock(&tc_mutex);
   	pthread_exit((void*) threadarg);

}
