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
				string cents;			//#'s to right of decimal
				string dollars; 		//#'s to left of decimal
				string newNumber;		//Number after punctuation
	 public:
				//Method Declarations
				void instructions()		//Print Instructions
				  {
					 clrscr();
					 cout << "    This program allows you to take a numeric price"
							<< endl
							<< "consisting of dollars and cents, and use them to"
							<< endl
							<< "produce a complete number with comma's." << endl
							<< endl;
				  } // end instructions

				void printNumber()		//Prints out punctuated number
				  {
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

	 do
		{
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
		  if (cents.length() < 3)
			 for (i = 0; i <= cents.length() - 1; i++)
				{
				  number = cents.get_at(i);
				  if ((number != '0') && (number != '1') && (number != '2') &&
						(number != '3') && (number != '4') && (number != '5') &&
						(number != '6') && (number != '7') && (number != '8') &&
						(number != '9'))
					 errorFlag = 1;
				}
		  else
			 errorFlag = 1;
		  //end if

		  //Print Error Message
		  if (errorFlag == 1)
			 cout << endl << "Invalid Number.  Please Try Again. " << endl << endl;
		  //end if
		}
	 while (errorFlag == 1);
	 cout << "Valid Number.  Thank you." << endl << endl;
  } //end inputValidNumber

void punctNum::addPunctuation()
  {
	 int i;			//Index for array

	 newNumber = dollars;
	 for (i = newNumber.length(); i > 0; i = i - 3)
		{
		  if (i == newNumber.length())
			 continue;
		  else
			 newNumber.insert(i,',');
		} // end for
	 newNumber.insert(newNumber.length(),'.');
	 newNumber.insert(newNumber.length(),cents);
	 newNumber.insert(0,'$');
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
	 do
		{
		  number1.instructions();
		  number1.inputValidNumber();
		  number1.addPunctuation();
		  number1.printNumber();
		  cout << endl << "Do you want to enter another number(Y/N). ";
		  cin >> doAgain;
		}
	 while (toupper(doAgain) == 'Y');
  }
