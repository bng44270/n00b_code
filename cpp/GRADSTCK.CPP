#include "stack.h"
#include <cstring.h>
#include <iostream.h>
#include <conio.h>
#include <ctype.h>
#include <iomanip.h>

//---------------------------------------------------------------------------
//Class inputStack
//---------------------------------------------------------------------------
class inputStack
  {
	 private:
			stack studentScores[5];			//Student grades
			stack studentReport[5];			//Second stack for after first pop
			int gradesPerStudent[5];		//# of grades for each student
			double studentAverage[5];		//Average for student of scores
			string studentName[5];			//name of student
			int maxStudent;					//number of students to process
	 public:
			void instructions()	//prints instructions
			  {
				 clrscr();
				 cout << "   This program is designed to input the grades" << endl
						<< "of up to 5 students, average them, and print them" << endl
						<< "out in a report form." << endl << endl;
			  } //end instructions

			void inputGrades(); 	//inputs data for students
			void calcGrades();	//calcualates grades for students
			void printReport();  //print student data in report
  }; //end class inputStack
//---------------------------------------------------------------------------
//Method Declarations
//---------------------------------------------------------------------------
void inputStack::inputGrades()
  {
	 int i;		//index for student loop
	 int j;		//index for grade loop
	 int gradeTemp;	//Temporary holder for grade
	 string fName;		//First Name
	 string lName;		//Last Name

	 cout << "Enter the number of students. ";
	 cin >> maxStudent;
	 for(i = 0; i < maxStudent; i++)
		{
		  cout << "Please enter the student " << (i + 1) << "'s first name. ";
		  cin >> fName;
		  cout << "Please enter the student " << (i + 1) << "'s last name. ";
		  cin >> lName;
		  studentName[i] = fName + " " + lName;
		  cout << "Please input the number of grades for "
				 << studentName[i] << ". ";
		  cin >> gradesPerStudent[i];
		  for (j = 0; j < gradesPerStudent[i]; j++)
			 {
				cout << "Please input grade " << (j + 1) << " for "
					  << studentName[i] << ". ";
				cin >> gradeTemp;
				studentScores[i].push(gradeTemp);
			 } //end for i
		} //end for i
  } //end inputGrades
//---------------------------------------------------------------------------
void inputStack::calcGrades()
  {
	 int i;		//index for student loop
	 int j;		//index for grade loop
	 int totTemp;	//Total Scores temp
	 int stackElTemp;		//Temporary Stack Element

	 for (i = 0; i < maxStudent; i++)
		{
		  totTemp = 0;
		  for (j = 0; j < gradesPerStudent[i]; j++)
			 {
				stackElTemp = studentScores[i].pop();
				studentReport[i].push(stackElTemp);
				totTemp += stackElTemp;
			 } //end for j
		  studentAverage[i] = totTemp / gradesPerStudent[i];
		} //end for i
  } //end calcGrades
//---------------------------------------------------------------------------
void inputStack::printReport()
  {
	 int i;			//index for student loop
	 int j;			//index for grade loop

	 clrscr();
	 for (i = 0; i < maxStudent; i++)
		{
		  cout << "For " << studentName[i] << ", here are his grades."
				 << endl;
		  for (j = 0; j < gradesPerStudent[i]; j++)
			 {
				cout << setw(7) << setiosflags(ios::right)
					  << studentReport[i].pop() << resetiosflags(ios::right)
					  << " %" << endl;
			 } //end for j
		  cout << "     With an average of " << studentAverage[i]
				 << " %" << endl << endl;
		} //end for i
	 cout << "End of Report" << endl;
  } //end printReport
//---------------------------------------------------------------------------
//Main Logic
//---------------------------------------------------------------------------
inputStack studentData;			//Student Info
char doAgain;						//Option to run program again

void main()
  {
	 do
		{
		  studentData.instructions();
		  studentData.inputGrades();
		  studentData.calcGrades();
		  studentData.printReport();
		  cout << "Do you wish to enter more data\? ";
		  cin >> doAgain;
		}
	 while (toupper(doAgain) == 'Y');
	 cout << "Program Done";
  } //end main
