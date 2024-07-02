/*
Serial Number Generator
10-02-01

Generates a range of serial number given an amount and a starting point
*/
#include <iostream.h>
#include <iomanip.h>
#include <ctype.h>

//-----------------------------------------------------------------------------
//Class serNumGen
class serNumGen
  {
	 private:
			int numNums;  					//Number of numbers
			int low;							//Lowest Number
			double numberArray[1000];	//ArrayOfNumbers
	 public:
			//Method Prototypes
			void instructions();			//Method to Print instructions
			void enterData();				//Method to Enter Data
			void doLoop();					//Method to generate numbers
  }; //end class serNumGen
//-----------------------------------------------------------------------------
//Method Declarations
//-----------------------------------------------------------------------------
//Method Print Instructions
void serNumGen::instructions()
  {
	 cout << " This is a program that allows you to generate a series of" << endl
			<< "serial numbers in numeric order. Just follow the on screen" << endl
			<< "instructions.  All numbers must be less than 1,000."	<< endl
			<< endl;
  } // end instructions
//-----------------------------------------------------------------------------
//Method EnterData
void serNumGen::enterData()
  {
	 cout << "Please enter the number of Serial Numbers to generate. ";
	 cin >> numNums;
	 cout << "Please enter your starting point. ";
	 cin >> low;
  } // end enterData
//-----------------------------------------------------------------------------
//Method doLoop
void serNumGen::doLoop()
  {
	 int i;  		//index in for loop
	 int counter;	//Serial Number Counter

	 counter = 1;
	 for (i = low; i <= low + numNums; i++)
		{
		  cout << setw(13) << setiosflags(ios::right) << "Serial Number"
				 << resetiosflags(ios::right) << setw(4) << setiosflags(ios::right)
				 << setprecision(0) << setiosflags(ios::fixed) << counter
				 << resetiosflags(ios::right) << resetiosflags(ios::fixed)
				 << setw(4) << setiosflags(ios::right) << "is "
				 << resetiosflags(ios::right) << setw(12)
				 << setiosflags(ios::right) << setprecision(0)
				 << setiosflags(ios::fixed) << i << resetiosflags(ios::right)
				 << resetiosflags(ios::fixed) << endl;
		  numberArray[counter - 1] = i;
		  counter++;
		} // end for
	 cout << endl << "Number Generation Conplete" << endl;
  } //end doLoop

//-----------------------------------------------------------------------------
//Main Logic
//-----------------------------------------------------------------------------
//Variable Declarations
char doAgain;						//Option to do program again
serNumGen serialNumberList;	//Serial Numbers

//-----------------------------------------------------------------------------
//Main Body
void main()
  {
	 do
		{
		  serialNumberList.instructions();
		  serialNumberList.enterData();
		  serialNumberList.doLoop();
		  cout << "Do Program Again? (Y/N) ";
		  cin >> doAgain;
		}
	 while(toupper(doAgain)=='Y');
	 cout << "Program Done!!";
  } //end main


