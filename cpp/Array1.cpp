/*
Pay Increaser

Written by Andy Carlson
*/

#include <iostream.h>
#include <iomanip.h>

const int size=20;				//Size of Array
double Pay[size];				//Array of Pay to be entered
int max;						//Maximum Array Value to Use
int i;							//Index for For Loop

void main()
  {
	 cout << "How many people do you want to increase the" << endl
			<< "pay on\? ";
	 cin >> max;

	 //Initilization
	 for (i = 0; i < size; i++)
		{
		  Pay[i] = 0;
		}

	 //Enter Data
	 for (i=0; i < max; i++)
		{
		  cout << "Enter the pay for person " << (i + 1) << ". ";
		  cin >> Pay[i];
		}

    cout << endl;
	 //Display Old Data
	 for (i=0; i < max; i++)
		{
		  cout << "Person " << (i + 1) << "'s pay is $"
				 << setprecision(2) << setiosflags(ios::showpoint)
				 << setiosflags(ios::fixed)<< Pay[i]
				 << resetiosflags(ios::showpoint) << setiosflags(ios::fixed)
				 << endl;
		}

	 //Do Calculates
	 for (i=0; i < max; i++)
		{
		  Pay[i] += (Pay[i] * 0.1) + 2;
		}

	 cout << endl;
	 //Display New Data
	 for (i=0; i < max; i++)
		{
		  cout << "Person " << (i + 1) << "'s new pay is $"
				 << setprecision(2) << setiosflags(ios::showpoint)
				 << setiosflags(ios::fixed)<< Pay[i]
				 << resetiosflags(ios::showpoint) << setiosflags(ios::fixed)
				 << endl;
		}
  }

