/*
Seminar.cpp

Used to figure the total cost of people attending a
seminar if for:

People		Cost/Person
1-4			$100
5-10			$80
11+			$60
*/

#include <iostream.h>

int totalPeople;
int totalCost;
const int cost1to4 = 100;
const int cost5to10 = 80;
const int cost11up = 60;

void main()
  {
	 cout << "Welcome to my first C++ Program.\n";
	 cout << "\n";
	 cout << "Please the number of people participating\n";
	 cout << "in the seminar.  ";
	 cin >> totalPeople;
	 if (totalPeople >= 1 && totalPeople <=4)
		{
		  totalCost = totalPeople * cost1to4;
		  cout << "The total cost for " << totalPeople << " people is $" << totalCost << ".\n";
		} //End $100 if
	 else
	 if (totalPeople >= 5 && totalPeople <= 10)
		{
		  totalCost = totalPeople * cost5to10;
		  cout << "The total cost for " << totalPeople << " people is $" << totalCost << ".\n";
		} // End $80 if
	 else
	 if (totalPeople >= 11)
		{
		  totalCost = totalPeople * cost11up;
		  cout << "The total cost for " << totalPeople << " people is $" << totalCost << ".\n";
		} // End $60 if
	 else
		cout << "Zero is an invalid entry.";
		// End Error Handler

	 cout << "Thank you for using my program.";
  }
