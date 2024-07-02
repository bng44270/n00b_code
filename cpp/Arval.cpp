/*
Array Validator

by Andy Carlson
10-9-01
*/
#include <iostream.h>
#include <ctype.h>
#include <conio.h>
#include <iomanip.h>

//----------------------------------------------------------------------
//Class arVal
class arVal
  {
	 private:
		int limit;						//Limit for usable array cells
		int arrayOfNumbers[1000]; //Array of numbers to use
	 public:
		//Constructors
		arVal() : limit(0)
			{  }			//Constructor with no params
		arVal(int high) : limit(high)
			{  }		  	//Constructor with 1 param
		//Method Prototypes
		void setLimit(); 		//Sets value of limit
		void putValue();		//Sets the value of an array element given an
									//index
		void getValue();		//Returns the value of an array element given
									//an index and an array
  }; //end class arVal
//----------------------------------------------------------------------
//Method Declarations
//----------------------------------------------------------------------
//Method setLimit
void arVal::setLimit()
  {
	 cout << "Please enter the highest index to use. (maximum = 1,000). ";
	 cin >> limit;
  } // end method setLimit
//----------------------------------------------------------------------
//Method putValue
void arVal::putValue()
  {
	 int idxTemp;		//Temporarily holds index to insert data at

	 do
		{
		  cout << "Please enter the index to insert your value. (Less than "
				 << limit  << "). ";
		  cin >> idxTemp;
		  if ((idxTemp > limit) || (idxTemp < 1))
			 cout << "Index out of range." << endl;
		  //end if
		}
	 while ((idxTemp > limit) || (idxTemp < 1));
	 cout << "Please enter the data to insert at index " << idxTemp << ". ";
	 cin >> arrayOfNumbers[idxTemp - 1];
  } // end method putValue
//----------------------------------------------------------------------
//Method getValue
void arVal::getValue()
  {
	 int idxTemp;		//Temporarily holds index to retrieve data from

	 do
		{
		  cout << "Please enter the index to retrieve data from. ";
		  cin >> idxTemp;
		  if ((idxTemp > limit) || (idxTemp < 1))
			 cout << "Index out of range." << endl;
		}
	 while ((idxTemp > limit) || (idxTemp < 1));
	 cout << "At index " << idxTemp << ", " << arrayOfNumbers[idxTemp - 1]
			<< " was retrieved. " << endl;
  } //end method getValue
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//Main Logic
//----------------------------------------------------------------------
//Function Prototypes
void menuSystem();		//This will show menu to choose action
//----------------------------------------------------------------------
//function main
void main()
  {
	 menuSystem();
	 cout << "Thanx for using this program. ";
  } // end main
//----------------------------------------------------------------------
//Function Declarations
void menuSystem()
  {
	 arVal arrayValidate;    	//Instance of arVal class
	 char menuChoice;          //Option that user enters

	 arrayValidate.setLimit();
	 //clrscr();
	 do
		{
		  cout << "** Options ** (E)nter Data -OR- (G)et Data ** X to Exit. ";
		  cin >> menuChoice;
		  if (toupper(menuChoice) == 'E')
			 arrayValidate.putValue();
		  //end if A
		  else if (toupper(menuChoice) == 'G')
			 arrayValidate.getValue();
		  //end if B
		  else
			 cout << "Exited" << endl;
		  //end else
		}
	 while (toupper(menuChoice) != 'X');
  }  //end menuSystem
