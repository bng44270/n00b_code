/*
Number punctuater

by Andy Carlson

Modifies a number and puts the proper punctuation in it
*/
#include <iostream.h>
#include <conio.h>
#include <ctype.h>
#include <iomanip.h>
#include <cstring.h>

//------------------------------------------------------------------------
//Class numPunct
class punctNum
  {
	 private:
				string segments[10];	//Segments of 3 or less (for 1) of numbers
				string cents;			//#'s to right of decimal
				string dollars; 		//#'s to left of decimal
				string newNumber;		//Number after punctuation
	 public:
				//Method Declarations
				void instructions()		//Print Instructions
				  {
					 cout << "   This is a program designed to take a number" << endl
							<< "that has no comma punctuation and add them to " << endl
							<< "the number.  Upon initial input, please use NO" << endl
							<< "COMMA's and NO SPACES and ALWAYS USE A " << endl
							<< "DECIMAL!!" << endl
							<< "Other than that, enjoy! :~)" << endl << endl;
				  } // end instructions

				void printNumber()		//Prints out punctuated number
				  {
					 clrscr();
					 cout << "Your new number is " << newNumber << endl;
				  } //end printNumber

				//Method Prototypes
				void inputValidNumber();		//Input and validate number
				void addPunctuation();			//Adds Punctuation
  }; //end punctNum

//------------------------------------------------------------------------
//Method Declarations
//------------------------------------------------------------------------
//Method inputValidNumber
void punctNum::inputValidNumber()
  {
	 int i;				//Index of array
	 char number;		//Number to evaluate
	 int errorFlag;   //If error = 1, no error = 0

	 Input:
	 i = 0;
	 errorFlag = 0;

	 cout << "Please input number of dollars . ";
	 cin >> dollars;

	 for (i = 0; i <= dollars.length() - 1; i++)
		{
		  //Do Left side
		  number = dollars.get_at(i);
		  if ((number != '0') && (number != '1') && (number != '2') &&
				(number != '3') && (number != '4') && (number != '5') &&
				(number != '6') && (number != '7') && (number != '8') &&
				(number != '9'))
			 errorFlag = 1;
		  //end if number not
		}

	 i = 0;
	 

	 cout << "Please input number of cents. ";
	 cin >> cents;

	 //Do Right Side
	 for (i = 0; i <= cents.length() - 1; i++)
		{
		  number = cents.get_at(i);
		  if ((number != '0') && (number != '1') && (number != '2') &&
				(number != '3') && (number != '4') && (number != '5') &&
				(number != '6') && (number != '7') && (number != '8') &&
				(number != '9'))
			 errorFlag = 1;
		  //end if number not
		}
	 if (errorFlag == 1)
		goto Input;
	 //end if
	 cout << "Valid Number.  Thank you." << endl;
  } //end inputValidNumber

void punctNum::addPunctuation()
  {
	 int i;			//Index for array
	 int widthU;	//Unknown width of first segment before comma
	 int curSeg;	//Index of current segment
	 int j;			//Index for segments
	 int offset;	//Offset of comma from beginning of string
	 int maxSeg;	//Max # of segments

	 widthU = dollars.length() % 3;
	 curSeg = 0;

	 //Initial Loop for first segment
	 for (i = 0; i < widthU; i++)
		{
		  segments[curSeg].insert(i,dollars.get_at(i));
		}


	 //Loop for rest of number
	 for ( ; i < dollars.length() - 1; i++)
		{
		  j = 0;
		  curSeg++;
		  for ( ;i < 4; i++)
			 {
				segments[curSeg].insert(j,dollars.get_at(i));
				j++;
			 }
		}
	 maxSeg = i;


	 i = 0;
	 newNumber.insert(i,'$');

	 curSeg = 0;
	 //Put first segment into newNumber

	 i++;
	 newNumber.insert(i,segments[curSeg]);
	 offset = segments[curSeg].length() + i;
	 newNumber.insert(offset,',');

	 do
		{
		  curSeg++;
		  i++;
		  offset = segments[curSeg].length() + i;
		  newNumber.insert(offset,',');
		}
	 while (curSeg <= maxSeg);
  } //end addPunctuation
//---------------------------------------------------------------------------
//Main Logic
//---------------------------------------------------------------------------
//Variables
punctNum number1;			//Instance of class
char doAgain;				//Option to do again

//---------------------------------------------------------------------------
//Body
void main()
  {
	 number1.instructions();
	 number1.inputValidNumber();
	 number1.addPunctuation();
	 number1.printNumber();
  }
