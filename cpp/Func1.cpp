/*
Program to Use Functions

by Andy Carlson

4-5-01
*/

#include <iostream.h>

//Variables
int NumberArray [4][6] = {{0},{0}};  	  //Array to hold
int i, j;								  //For Loop Indexes

//Function Prototypes
void PrintArray(int [4][6]);
int GetArrayValues(int, int);

void main()
  {
	 //Initialize Array
	 for(i = 0; i < 4; i++)
		{
		  for(j =  0; j < 6; j++)
			 {
				NumberArray[i,j];
			 } // end j
		} // end i

	 //Put Data in Array
	 for (i = 0; i < 4; i++)
		{
		  for(j = 0; j < 6; j++)
			 {
				NumberArray[i][j] = GetArrayValues(i,j);
			 } // end j
		} // end i

		PrintArray(NumberArray);

		cout << "Thank you for using my program!!!";
  } //end main

//Function Declarations
int GetArrayValues(int i1, int j1)
  {
	 int CellData;				//Data for the cell of (i,j)
	 cout << "Enter the info for row " << (i1 + 1) << ", column " << (j1 + 1) << ". ";
	 cin >> CellData;
	 return CellData;
  }  //end GetArrayData

void PrintArray (int ArrayToUse[4][6])
 {
	 cout << "               1        2          3        4         5" << endl
			//Row 1
			<< "  1       "<< ArrayToUse[0][0] << "         " << ArrayToUse[0][1]
								<< "          " << ArrayToUse[0][2] << "       "
								<< ArrayToUse[0][3] << "        " << ArrayToUse[0][4]
								<< endl
			//Row 2
			<< "  1       "<< ArrayToUse[1][0] << "         " << ArrayToUse[1][1]
								<< "          " << ArrayToUse[1][2] << "       "
								<< ArrayToUse[1][3] << "        " << ArrayToUse[1][4]
								<< endl
			//Row 3
			<< "  1       "<< ArrayToUse[2][0] << "         " << ArrayToUse[2][1]
								<< "          " << ArrayToUse[2][2] << "       "
								<< ArrayToUse[2][3] << "        " << ArrayToUse[2][4]
								<< endl
			//Row 4
			<< "  1       "<< ArrayToUse[3][0] << "         " << ArrayToUse[3][1]
								<< "          " << ArrayToUse[3][2] << "       "
								<< ArrayToUse[3][3] << "        " << ArrayToUse[3][4]
								<< endl;
	 } //end PrintArray

