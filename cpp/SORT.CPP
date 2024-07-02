/*
Sorter

By Andy Carlson

*/
#include <iostream.h>
#include <ctype.h>

// Declare Variables and Constants
const int ArraySize = 20;		//Size of the Array
int NumberArray[ArraySize],	//Array of numbers to sort
	 Usable,							//Amount of array cells that are usable
	 Largest,						//Index
	 Last,                  	//Index
	 Temp,							//Temporary Place Holder
	 i;								//Index
char again = 'Y',					//Option to do again
	  order;							//Order to view records in


void main()
  {
	 while (toupper(again) == 'Y')
		{
		  cout << "Welcome to my program.  This will allow you to" << endl
				<< "enter up to 20 integer values, and have them" << endl
				<< "sorted from in accending or decending order." << endl;
		 //Initialize the array
		 for(i=0; i > ArraySize - 1; i++)
			{
			  NumberArray[i] = 0;
			}    //end for

		 //Enter calues into array
		 cout << endl
				<< "Please enter the number of entries you have (1-20) ";
		 cin >> Usable;
		 for(i = 0; i < Usable; i++)
			{
			  cout << "Please enter number " << (i + 1) << " ";
			  cin >> NumberArray[i];
			}  //end for

		 cout << endl;
		 //Display Data
		 for(i = 0; i < Usable; i++)
			{
			  cout << "Number " << (i + 1) << " is " << NumberArray[i] << "." << endl;
			}  //end for


		 cout << endl;

		 //SORT IT!!!!
		 for(Last = (Usable - 1); Last >= 1; Last --)
			{
			  Largest = 0;
			  for (i = 1; i <= Last; i++)
				 if (NumberArray[i] > NumberArray[Largest])
					Largest = i;
				 //end if
			  //end for i

			  Temp = NumberArray[Last];
			  NumberArray[Last] = NumberArray[Largest];
			  NumberArray[Largest] = Temp;
			}  //end for last

		 cout << endl << endl;
		 //Display Sorted Data
		 cout << "Do you wish to view records in  (A)scending" << endl
				<< "or (D)escending order? ";
		 cin >> order;
		 if (toupper(order) == 'A')
			{
			  cout << "Here are your numbers in ascending order" << endl;
			  for(i = 0; i < Usable; i++)
				 cout << "Number " << (i + 1) << " is " << NumberArray[i] << "." << endl;
			  //end for
			} // end if A
		 else
		 if (toupper(order) == 'D')
			{
			  cout << "Here are your numbers in descending order" << endl;
			  for(i = (Usable - 1); i >= 0; i--)
				 cout << "Number " << (i + 1) << " is " << NumberArray[i] << "." << endl;
			  //end for
			} // end if B

		 //Ask to Continue
		 cout << endl << "Do you wish to sort again? (Y/N) ";
		 cin >> again;
	 }
	 cout << "Thanx for using this program";
  }

