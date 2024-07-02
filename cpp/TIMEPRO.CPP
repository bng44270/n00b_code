/*
Time Program

By Andy Carlson

4-12-01
*/

#include <iostream.h>

//Variables
int Lateness;			//
char SchoolTime[6];	//
char WakeUpTime[6];	//

//Function Prototypes
void GetData(int *, char *, char *);
void Instructions();
void PrintData(int, char, char);

void main()
  {
	 Instructions();
	 GetData((int *)Lateness, (char *)SchoolTime, (char *)WakeUpTime);
	 PrintData(Lateness, (char *)SchoolTime, (char *)WakeUpTime);
  } //end main


//Function Declarations
void Instructions()
  {
	 cout << "    Welcome to this really cool program to find out how late" << endl
			<< "Mo will be for C++.  Please follow the onscreen instructions" << endl
			<< "and enter all time values in military time with a colon." << endl
			<< "(i.e. 04:34)" << endl;
  } // end Instructions

void GetData(int *Late, char *School[6], char *WakeUp[6])
  {
	 int GetReady,		//
		  WakeUpMin,	//
		  SchoolMin,	//
		  MiddleMin;	//



	 cout << "Enter the time you you wake up ";
	 cin >> *WakeUp;
	 cout << "Enter the time class starts ";
	 cin >> *School;
	 cout << "How many minues does it take to get ready ";
	 cin >> GetReady;
	 WakeUpMin = ((((int)WakeUp[0] * 10) + (int)WakeUp[1]) * 60) + ((int)WakeUp[3] + (int)WakeUp[4]);
	 SchoolMin = ((((int)School[0] * 10) + (int)School[1]) * 60) + ((int)School[3] + (int)School[4]);
	 MiddleMin = WakeUpMin + GetReady;
	 if (MiddleMin > SchoolMin)
		{
		  (int)Late = SchoolMin -  MiddleMin;
		}
	 else
		{
		  Late = 0;
		}
	 //end if
  } //end GetData

void PrintData(int Late, char School[6], char WakeUp[6])
  {
	 if (Late != 0)
		{
		  cout << "    If you wake up at " << WakeUp << " and leave for school" << endl
				 << "at " << School << ", then you will be " << Late << " minutes late.";
		}
	 else
		cout << "You will not be late!!!  Good Job Mo!!!";
	 //end if
  } //end Print Data
