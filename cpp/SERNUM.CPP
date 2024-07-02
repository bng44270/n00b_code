/*
Serial Number Tracker
by Andy Carlson
9-19-01
*/

#include <iostream.h>
#include <ctype.h>
#include <conio.h>


//--------- serNum Class --------------------------------------------------
class serNum
  {
	 private:
				double serialNumber;			//Serial Number Stored in Class
	 public:
				//Method Prototypes
				void putNumber(double);		//Sets Serial Number
				double getNumber(); 			//Returns Serial Number
  };
//-------------------------------------------------------------------------
//Class Method Declaration

//putNumber Declaration
void serNum::putNumber(double sn)
  {
	 serialNumber = sn;
  } //end method putNumber

//getNumber Declaration
double serNum::getNumber()
  {
	 return serialNumber;
  } //end method getNumber

//-------------------------------------------------------------------------
//Main Program Variable Declarations
char doAgain;					//Option to continue
serNum serNums[10];			//Serial Number Classes
int numCount;					//Number of Serial Numbers to Enter
int i;							//Index for for loop
double serNumTmp;			//Temporary Holder for Serial Numbers


//-------- Main Logic -----------------------------------------------------
void main()
  {
	 do
		{
		  cout << "Please enter the number of serial Numbers ";
		  cin >> numCount;
		  clrscr();
		  clrscr();
		  //For Loop for entering Data
		  for (i = 0; i < numCount; i++)
			 {
				cout << "Please enter serial number " << (i + 1) << ". ";
				cin >> serNumTmp;
				serNums[i].putNumber(serNumTmp);
			 } // end for
		  clrscr();
		  //For Loop for printing Data
		  for (i = 0; i < numCount; i++)
			 {
				cout << "Serial Number " << (i + 1) << " is "
					  << serNums[i].getNumber() << endl;
			 } // end for
		  cout << "Do you wish to enter more serial numbers? ";
		  cin >> doAgain;
		}
	 while(toupper(doAgain)== 'Y');
	 cout << "Thanx for using my first object oriented program";
  } // end main

//-------------------------------------------------------------------------

