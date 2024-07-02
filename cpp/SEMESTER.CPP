/*
Property Tax Figurer

by Andy Carlson

4-19-01
*/
#include <iostream.h>
#include <iomanip.h>
#include <ctype.h>
#include <math.h>

//Variable Declarations
char DoAgain = 'Y';		//Y or N

//Structure Declarations
struct Counters	 		//Group of Counters
  {
	 int Total;				//Counter of Total Assesments
	 int Residential;		//Counter of Residential Assesments
	 int Business;			//Counter of Business Assesments
	 int Farm;		 		//Counter of Farm Assesments
	 int Rental;			//Counter of Rental Assesments
  } AssesmentCounters;	//Global Initialization

struct Assesments				//Record for Assments
  {
	 char PropertyID[6];		//Property ID Number
	 int PropertyType;		//Property Type
									//Residential = 1
									//Business = 2
									//Farm = 3
									//Rental = 4
	 char PropertyChar[12];	//Name of Property
	 int Age;					//Age of Property Owner
	 double AssesValue;		//Assesed Value of Property
	 double Tax;				//Amount of Tax
	 char Comments[20];		//Comments About Record
  } PropertyArray[25];

//Function Prototypes
void Instruct();											//Print Instructions
void GetData(Assesments *[25], Counters &); 	   //Input Data Into Structure
void Calc(Assesments *[25], Counters &);			//Calculate Taxes on Structure Data
void PrintReport(Assesments *[25], Counters &);	//Print Report with Statistics

//Main Logic
void main()
  {
	 Instruct();
	 while (toupper(DoAgain == 'Y')
		{
		  GetData(PropertyArray, AssesmentCounters);
		  Calc(PropertyArray);
		  PrintReport(PropertyArray, AssesmentCounters);
		  cout << "Do You Wish to Create a New Report? ";
		  cin DoAgain;
		}
	 cout << "Happy Semester!!!  Bye, Bye";
  }  //end main

//Function Declarations

void Calc(Assesments *PropertyInfo[25])
  {
	 int i;			//Index for for loop
	 for(i=0; i > 25; i++)
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
				PropertyInfo[i].Comments = 'Record OK';
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
				PropertyInfo[i].Comments = 'Record OK';
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
				PropertyInfo[i].Comments = 'Record OK';
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
				PropertyInfo[i].Comments = 'Record OK';
			  } //end Rental
		  else
		  //For Errors
			 PropertyInfo[i].Comments = 'Error In Record';
		  //end Errors
		} // end for
	 cout << "Report Created" << endl;
  } // end Calc
