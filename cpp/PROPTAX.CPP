 /*
 Program:  Property Tax
 Name:     Sara Smith -- Main and PrintReport (Code)
			  Andy Carlson -- Calc and Instructions (Code, Pseudo, Flow),
					and Main and PrintReport (Flow and Pseudo)
			  Jake 		  --Input and Counters (Code, Pseudo, and Flow)
 */

#include <iostream.h>
#include <iomanip.h>
#include <ctype.h>
#include <math.h>

//declare and initialize variables

char Continue = 'Y';              //Continue
int Filled;								 //Array Record Filled

struct Counters
{
int FarmCount;       //Farm Tax
int ResCount;       //Residential Tax
int RentCount;       //Rental Tax
int BusCount;       // Business Property
int Total;       // Total
} AssesmentCounters;

struct Assesments
{
char PropertyID [6];           //Property ID number

int PropertyType;              //Property Type
										 //Residential = 1
										 //Business = 2
										 //Farm = 3
										 //Rental = 4
char PropertyChar [12];        //
int Age;                 	    //Age
double AssesValue;             //Assesment Value
double Tax;                    //Tax
int CommentVal;					 //Value of Comments
										 //1 = OK
										 //2 = Bad
} Report[25];

//Function Prototypes
void Instruct();    										   //Instructions
void FillArray(Assesments[25], int &);  				//Enter Data
void Totals(Assesments[25], Counters &);  			//Count
void Calc(Assesments[25]);  								//Calculations
void PrintReport(Assesments [25], Counters, int);  //Print

//Main

void main ()
{
  Instruct ();
  while (toupper(Continue) == 'Y')
  {
	 FillArray (Report,Filled);
	 Totals(Report,AssesmentCounters);
	 Calc(Report);
	 PrintReport(Report, AssesmentCounters, Filled);
  cout << "Do you want to enter another set of data\? ";
  cin  >> Continue;

  }//end while

}//end main

//Function Declaration
void Instruct()
  {
	 cout << "     Welcome to this program.  It will calculate the property " << endl
			<< "tax for 25 people given the assesed value on their house.  So," << endl
			<< "enjoy this program." << endl << endl;
  } //end instruct

void FillArray(Assesments Prop[], int &used)
{
  int x = 0;				//Index for Array;
  char Continue = 'Y';  //Continue Option
  //Fills array with data and creates report
  while(toupper(Continue) == 'Y')
  {
	 //Enters Data into Array
	cout << "Enter Property Id for person " << (x + 1) << endl;
	cin >> Prop[x].PropertyID;
	cout << "Enter Type of Real Estate: " << endl;
	cout << "1 for Residential, 2 for Business, 3 for Farm, 4 for Rental" <<endl;
	cin >> Prop[x].PropertyType;
	cout << "Enter Owner Age of person " << (x + 1) << endl;
	cin >> Prop[x].Age;
	cout << "Enter the Value of Property of person " << (x + 1) << endl;
	cin >> Prop[x].AssesValue;
	cout << "Do you want to enter more data\? ";
	cin >> Continue;
	if (toupper(Continue) == 'Y')
	  {
		 x++;
		 used = x;
	  }
	// end if
  }// End while
ENDING:

}// End of Function

void Totals(Assesments Prop[25], Counters &FigureCount)
{
  FigureCount.ResCount = 0;
  FigureCount.BusCount = 0;
  FigureCount.FarmCount = 0;
  FigureCount.RentCount = 0;
  for (int x = 0; x < 25; x = x + 1)
  {
	if (Prop[x].PropertyType == 1)
		FigureCount.ResCount = FigureCount.ResCount + 1;

	else if (Prop[x].PropertyType == 2)
		FigureCount.BusCount = FigureCount.BusCount + 1;

	else if (Prop[x].PropertyType == 3)
		FigureCount.FarmCount = FigureCount.FarmCount + 1;

	else if (Prop[x].PropertyType == 4)
		FigureCount.RentCount = FigureCount.RentCount + 1;
  }//End For
}// End of Function

void Calc(Assesments PropertyInfo[25])
  {
	 int i;			//Index for for loop
	 for(i=0; i < 25; i++)
		{
		  PropertyInfo[i].Tax = 0;
		  //For Residential
		  if(PropertyInfo[i].PropertyType == 1)
			 {
				if (PropertyInfo[i].AssesValue > 250000.0)
				  {
					 PropertyInfo[i].Tax += PropertyInfo[i].AssesValue * .02;
				  }
				PropertyInfo[i].Tax += PropertyInfo[i].AssesValue * .05;
				if (PropertyInfo[i].Age > 65)
				  {
					 PropertyInfo[i].Tax -= PropertyInfo[i].Tax * 0.1;
				  }
				PropertyInfo[i].CommentVal = 1;
			 } // end Residential
		  else
		  //For Business
		  if(PropertyInfo[i].PropertyType == 2)
			 {
				if (PropertyInfo[i].AssesValue > 250000.0)
				  {
					 PropertyInfo[i].Tax += PropertyInfo[i].AssesValue * .02;
				  }
				PropertyInfo[i].Tax += PropertyInfo[i].AssesValue * .15;
				if (PropertyInfo[i].Age > 65)
				  {
					 PropertyInfo[i].Tax -= PropertyInfo[i].Tax * 0.1;
				  }
				PropertyInfo[i].CommentVal = 1;
			 } // end Business
		  else
		  //For Farm
		  if(PropertyInfo[i].PropertyType == 3)
			 {
				if (PropertyInfo[i].AssesValue > 250000.0)
				  {
					 PropertyInfo[i].Tax += PropertyInfo[i].AssesValue * .02;
				  }
				PropertyInfo[i].Tax += PropertyInfo[i].AssesValue * .03;
				if (PropertyInfo[i].Age > 65)
				  {
					 PropertyInfo[i].Tax -= PropertyInfo[i].Tax * 0.1;
				  }
				PropertyInfo[i].CommentVal = 1;
			 }  //end Farm
		  else
		  // For Rental
		  if(PropertyInfo[i].PropertyType == 4)
			 {
				if (PropertyInfo[i].AssesValue > 250000.0)
				  {
					 PropertyInfo[i].Tax += PropertyInfo[i].AssesValue * .02;
				  }
				PropertyInfo[i].Tax += PropertyInfo[i].AssesValue * .10;
				if (PropertyInfo[i].Age > 65)
				  {
					 PropertyInfo[i].Tax -= PropertyInfo[i].Tax * 0.1;
				  }
				PropertyInfo[i].CommentVal = 1;
			  } //end Rental
		  else
		  //For Errors
			 PropertyInfo[i].CommentVal = 2;
		  //end Errors
		} // end for
	 cout << "Report Created" << endl;
  } // end Calc

void PrintReport(Assesments Assesmentstwo [25], Counters Counterstwo, int arrayfil)
{
  int i;   //index of for loop
  cout << "Property ID    Property Type    Age    Assesment Value     Tax " << endl
		 << "                                              Comments " << endl << endl;
  for (i = 0; i < (arrayfil + 1);  i++)
	{
	 cout << setw(12) << setfill(' ') << Assesmentstwo[i].PropertyID << "    ";
	 if(Assesmentstwo[i].PropertyType == 1)
		cout << setw(14) << setfill(' ') << "Residential" <<"    ";
	 else
	 if(Assesmentstwo[i].PropertyType == 2)
		cout << setw(14) << setfill(' ') << "Business" <<"    ";
	 else
	 if(Assesmentstwo[i].PropertyType == 3)
		cout << setw(14) << setfill(' ') << "Farm" <<"    ";
	 else
	 if(Assesmentstwo[i].PropertyType == 4)
		cout << setw(14) << setfill(' ') << "Rental" <<"    ";
	 else
		cout << setw(14) << setfill(' ') << "Invalid (" << Assesmentstwo[i].PropertyType << ")" <<"    ";
	 //end ifs
	 cout << setw(3) << setfill (' ') << Assesmentstwo[i].Age << "    "
			<< setw(15) << setfill(' ') << setprecision(2) << setiosflags(ios::fixed)
			<< setiosflags(ios::showpoint) << Assesmentstwo[i].AssesValue
			<< resetiosflags(ios::fixed) << resetiosflags(ios::showpoint)
			<< setw(10) << setfill(' ') << setprecision(2) << setiosflags(ios::fixed)
			<< setiosflags(ios::showpoint) << Assesmentstwo[i].Tax
			<< resetiosflags(ios::fixed) << resetiosflags(ios::showpoint) << endl
			<< "                                       ";
	 if (Assesmentstwo[i].CommentVal == 1)
		cout << setw(20) << setfill (' ') << "Record OK" << endl << endl;
	 if (Assesmentstwo[i].CommentVal == 2)
		cout << setw(20) << setfill (' ') << "Bad Record" << endl << endl;
	 // end ifs
	} // end for
	cout << endl << endl
		  << "Here are the totals:" << endl
		  << setw(15) << setfill(' ') << "Residential" << setw(30) << setfill(' ')
		  << Counterstwo.ResCount << endl
		  << setw(15) << setfill(' ') << "Business" << setw(30) << setfill(' ')
		  << Counterstwo.BusCount << endl
		  << setw(15) << setfill(' ') << "Farm" << setw(30) << setfill(' ')
		  << Counterstwo.FarmCount << endl
		  << setw(15) << setfill(' ') << "Rental" << setw(30) << setfill(' ')
		  << Counterstwo.RentCount << endl;

} //end print report
