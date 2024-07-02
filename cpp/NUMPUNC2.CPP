/*
Number punctuater

by Andy Carlson

Modifies a number and puts the proper punctuation in it
*/
#include <iostream.h>
#include <conio.h>
#include <ctype.h>
#include <iomanip.h>

//------------------------------------------------------------------------
//Class numPunct
class numPunct
  {
	 private:
				int right;				//Number of numbers on the right of decimal
				int left;				//Number of numbers on the left of decimal
				int decimalIndex;		//Array index where the decimal is at
				int totalCount;		//Total number to right, left, and decimal
				char oldNumber[30];	//Number user inputs
				char newNumber[30];	//Number after punctuation
	 public:
				//Constructors
				numPunct() : right (0), left(0)
				  {  }					//Constructor with no param's
				numPunct(int l, int r) : right(r), left(l)
				  {  }					//Constructor with 2 param's

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
					 cout << "Thanks to this superb program, your number went from"
							<< endl << endl << setw(13) << setiosflags(ios::right)
							<< "This -> " << oldNumber << resetiosflags(ios::right)
							<< endl << endl << setw(13) << setiosflags(ios::right)
							<< "To This -> " << newNumber << resetiosflags(ios::right)
							<< endl << endl;
				  } //end printNumber

				//Method Prototypes
				void inputValidNumber();		//Input and validate number
				void addPunctuation();			//Adds Punctuation
  }; //end punctNum

//---------------------------------------------------------------------------
//Method Declarations
//---------------------------------------------------------------------------
//Method inputValidNumber
void numPunct::inputValidNumber()
  {
	 int i;				//index for for loop
	 int errorFlag;   //If error = 1, if no error = 0

	 do
		{
		  errorFlag = 0;
		  cout << "Please enter your number. ";
		  cin >> oldNumber;
		  i = 0;

		  //Does left side of decimal
		  do
			 {
				if ((oldNumber[i] != '0') || (oldNumber[i] != '1') ||
					 (oldNumber[i] != '2') || (oldNumber[i] != '3') ||
					 (oldNumber[i] != '4') || (oldNumber[i] != '5') ||
					 (oldNumber[i] != '6') || (oldNumber[i] != '7') ||
					 (oldNumber[i] != '8') || (oldNumber[i] != '9'))
				  errorFlag = 1;
				//end if
				i++;
				if (oldNumber[i] == '.')
				  {
					 left = i - 1;
					 errorFlag = 0;
				  } //end if
			 }
		  while (oldNumber[i] != '.');

		  //Does decimal Point
		  decimalIndex = i;
		  i++;

		  //Does right side of decimal
		  do
			 {
				if ((oldNumber[i] != '0') || (oldNumber[i] != '1') ||
					 (oldNumber[i] != '2') || (oldNumber[i] != '3') ||
					 (oldNumber[i] != '4') || (oldNumber[i] != '5') ||
					 (oldNumber[i] != '6') || (oldNumber[i] != '7') ||
					 (oldNumber[i] != '8') || (oldNumber[i] != '9'))
				  errorFlag = 1;
				//end if
				i++;
				if (oldNumber[i] == ' ')
				  {
					 right = (i - 1) - (left + 1);
					 errorFlag = 0;
				  } //end if
			 }
		  while (oldNumber[i]  != ' ');
		  if (errorFlag == 1)
			 cout << "Invalid Number.  Try Again." << endl;
		  //end if
		}
	 while (errorFlag == 1);
	 cout << "Number Valid.  Thank you." << endl;
  } //end inputValidNumber
//---------------------------------------------------------------------------
//Method addPunctuation
void numPunct::addPunctuation()
  {
	 int i;				//Index for for loop
	 int pointer;		//Pointer to index in newNumber
	 int max;			//Maximim number of indecies of segment (right or left)
	 int difference;	//difference from pointer and index

	 max = 29; 			//To last index in newNumber
	 difference = max - right;
	 pointer = max - difference;
	 for (i = max; i > difference; i--)
		{
		  oldNumber[decimalIndex + pointer] = newNumber[i];
		  pointer --;
		} //end for

	 newNumber[i] = '.';
	 max = difference - 1;
	 difference = max - left;
	 pointer = max - difference;
	 for (i = max; i > difference; i--)
		{
		  oldNumber[decimalIndex + pointer] = newNumber[i];
		  pointer --;
		} // end for

	 newNumber[i] = '$';
  } // end addPunctuation
//---------------------------------------------------------------------------
//Main Logic
//---------------------------------------------------------------------------
//Variables
numPunct unpunctuatedNumber;			//Number to Punctuate
char doAgain;								//Option to do program again

//---------------------------------------------------------------------------
//Main Body
void main()
  {
	 unpunctuatedNumber.instructions();
	 unpunctuatedNumber.inputValidNumber();
	 unpunctuatedNumber.addPunctuation();
	 unpunctuatedNumber.printNumber();
  } // end main





