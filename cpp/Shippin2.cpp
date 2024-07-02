/*
Shipping.cpp       By Andy Carlson

By entering the shipping charges incurred by New Jersey,
Maine, and Texas, a total is calculated for each state.
The number of errors are figured, too.
*/

#include <iostream.h>  //For Basic IO functions
#include <iomanip.h>   //To Format output
#include <ctype.h>     //To "toupper" function

void main()
  {
	 double MaineTotal = 0.00;        	//Total Shipping Cost for Maine
	 double TexasTotal = 0.00;        	//Total Shipping Cost for Texas
	 double NewJerseyTotal = 0.00;    	//Total Shipping Cost for New Jersey
	 int MaineTransactions = 0;    	    //Total Transactions for Maine
	 int TexasTransactions = 0;      	//Total Transactions for Texas
	 int NewJerseyTransactions = 0;  	//Total Transactions for New Jersay
	 char StateAbr[3] = {'A','B'};	   	//Inputed State Abbreviation
	 int ErrorHandler = 0;           	//Number of Errors
	 char Continue;                  	//Option to continue
	 const double MaineCost = 25.00;  	//Cost of shipping to Maine
	 const double TexasCost = 30.00;  	//Cost of shipping to Texas
	 const double NewJerseyCost = 32.50;//Cost of shipping to New Jersey
	 int i;                             //Incrimenter in string search
	 int StateCode = 0;					//Numeric code for the state

	 //Main Logic
	 cout << "Welcome to my program that figures the amount of"
			<< endl
			<< "shipping due for a given state.  You Must enter"
			<< endl
			<< "the state and the shipping cost incurred by that"
			<< endl
			<< "state."
			<< endl
			<< endl;
	 //While loop for entering data
	 do
		{
		  cout << "Please enter your state. ";
		  cin >> StateAbr;
			 i = 0;
		  if (toupper(StateAbr[i])=='M')
			 {
					 i++;
					 if(toupper(StateAbr[i])=='E')
						{
						  StateCode = 1;
						}
			 } //End Maine
		  else
		  if (toupper(StateAbr[i]) == 'T')
			 {
					 i++;
					 if (toupper(StateAbr[i]) == 'X')
						{
						  StateCode = 2;
						}
				} //End Texas
		  else
		  if (toupper(StateAbr[i]) == 'N')
				{
					 i++;
					 if (toupper(StateAbr[i]) == 'J')
						{
						  StateCode = 3;
						}
				} //End New Jersey
		  switch (StateCode)
			 {
				//Maine
				case 1: MaineTransactions ++;
						  MaineTotal = MaineTotal + MaineCost;
						  break;
				//Texas
				case 2: TexasTransactions ++;
						  TexasTotal = TexasTotal + TexasCost;
						  break;
				//New Jersey
				case 3: NewJerseyTransactions ++;
						  NewJerseyTotal = NewJerseyTotal + NewJerseyCost;
						  break;
				default: ErrorHandler++;
			 }
		  cout << endl
				 << "Do you wish to do another? ";
		  cin >> Continue;

		} while (toupper(Continue)=='Y');
	  cout << "Well...."
			<< endl
		  << "           Here They Are!"
		  << endl
		  << endl
		  << "     --State--  --Sales--	  --Cost--"
		  << endl
		  << endl
		  << "       Maine     "
			 //Format Maine
		  << setw(17) << setfill(' ') << setiosflags(ios::right)
			 << MaineTransactions << resetiosflags(ios::right)
		  << setw(15) << setfill(' ') << setprecision(2)
			 << setiosflags(ios::fixed) << setiosflags(ios::right) << "$"
			 << MaineTotal << resetiosflags(ios::fixed)
			 << resetiosflags(ios::right)
			 //end Format Maine
		  << endl
		  << "       Texas     "
			 //Format Texas
		  << setw(17) << setfill(' ') << setiosflags(ios::right)
			 << TexasTransactions << resetiosflags(ios::right)
		  << setw(15) << setfill(' ') << setprecision(2)
			 << setiosflags(ios::fixed) << setiosflags(ios::right) << "$"
			 << TexasTotal << resetiosflags(ios::fixed)
			 << resetiosflags(ios::right)
          //end Format Texas
		  << endl
		  << "       New Jersey"
          //Format New Jersey
		  << setw(17) << setfill(' ') << setiosflags(ios::right)
          << NewJerseyTransactions << resetiosflags(ios::right)
		  << setw(15) << setprecision(2) << setfill(' ')
          << setiosflags(ios::fixed) << setiosflags(ios::right) << "$"
          << NewJerseyTotal << resetiosflags(ios::fixed)
          << resetiosflags(ios::right)
          //end Format New Jersey
		  << endl
		  << endl
		  << "       Errors -------> " << ErrorHandler
		  << endl
          << endl
		  << "Well..."
		  << endl
		  << "            That's All Folks!";
  }
