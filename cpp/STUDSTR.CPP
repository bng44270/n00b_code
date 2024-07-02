/*
Class GPA Finder

Created by Andy Carlson

Note:  The reason this program looks so messed up is because ....

	  I HATE HARDCODING!!!!!!!!!
*/

#include <iostream.h>
#include <string.h>
#include <ctype.h>

struct StudentInfo
  {
	 int StudentNumber;				//Student ID Number
	 float GPA;							//GPA of a student
	 char ClassRank[10];				//Class a student is in
  } StudentInfoStruct;           //Usable copy of StudentInfo

int NumberOfStudents;				//Number of students to input
int i;									//Incrimentor for for loop
int FreshmanCount = 0; 				//Number of Freshmen
int SophmoreCount = 0;				//Number of Sophmores
int JuniorCount = 0;					//Number of Juniors
int SeniorCount = 0;					//Number of Seniors
int FreshmanIDs[10];					//Freshman ID Numbers
int SophmoreIDs[10];					//Sophnore ID Numbers
int JuniorIDs[10];					//Junior ID Numbers
int SeniorIDs[10];					//Senior ID Numbers
float FreshmanGPAs[10];				//Freshman GPA's
float SophmoreGPAs[10];				//Sophmore GPA's
float JuniorGPAs[10];				//Junior GPA's
float SeniorGPAs[10];				//Senior GPA's
float FreshmanGPA = 0;  			// Accumulators to keep track of Freshman GPA
float SophmoreGPA = 0;				// Accumulators to keep track of Sophmore GPA
float JuniorGPA = 0; 				// Accumulators to keep track of Junior GPA
float SeniorGPA = 0;  				// Accumulators to keep track of Senior GPA

void main()
  {
	 cout << "Please input the number of people. ";
	 cin >> NumberOfStudents;
	 for (i = 0; i > NumberOfStudents; i++)
		{
		  cout << "Enter the ID Number for student #" << i + 1 <<". ";
		  cin >> StudentInfoStruct.StudentNumber;
		  cout << "Enter the GPA for student #" << i + 1 << ". ";
		  cin >> StudentInfoStruct.GPA;
		  cout << "Enter the Class that student #" << i + 1 << " is in. ";
		  cin >> StudentInfoStruct.ClassRank;

		  //Determine Class
		  if (toupper(StudentInfoStruct.ClassRank[0])=='F')
			 {
				// Freshman Code
				FreshmanIDs[FreshmanCount] = StudentInfoStruct.StudentNumber;
				FreshmanGPAs[FreshmanCount] = StudentInfoStruct.GPA;
				FreshmanCount ++;
				FreshmanGPA = (FreshmanGPAs[FreshmanCount - 1] + FreshmanGPA) / FreshmanCount;
			 }
		  else if (toupper(StudentInfoStruct.ClassRank[1])=='O')
			 {
				//Sophmore Code
				SophmoreIDs[SophmoreCount] = StudentInfoStruct.StudentNumber;
				SophmoreGPAs[SophmoreCount] = StudentInfoStruct.GPA;
				SophmoreCount ++;
				SophmoreGPA = (SophmoreGPAs[SophmoreCount - 1] + SophmoreGPA) / SophmoreCount;
			 }
		  else if (toupper(StudentInfoStruct.ClassRank[0])=='J')
			 {
				//Junior Code
				JuniorIDs[JuniorCount] = StudentInfoStruct.StudentNumber;
				JuniorGPAs[JuniorCount] = StudentInfoStruct.GPA;
				JuniorCount ++;
				JuniorGPA = (JuniorGPA + JuniorGPAs[JuniorCount - 1]) / JuniorCount;
			 }
		  else if (toupper(StudentInfoStruct.ClassRank[1])=='E')
			 {
				//Senior Code
				SeniorIDs[SeniorCount] = StudentInfoStruct.StudentNumber;
				SeniorGPAs[SeniorCount] = StudentInfoStruct.GPA;
				SeniorCount ++;
				SeniorGPA = (SeniorGPAs[SeniorCount - 1] + SeniorGPA) / SeniorCount;
			 }
		  else
			 cout << "That was INVALID.  Try Again";

		  //End If
		} //End For
	 cout << "Now ..." << endl
			<< "           Here is your info:" << endl;

	 //Freshman Output
	 cout << "Here are the Freshmen:" << endl << endl
			<< "    ID Number             GPA" << endl;
	 for (i = 0; i > FreshmanCount; i++)
		{
		  cout << "    " << FreshmanIDs[i] << "            " << FreshmanGPAs[i] << endl;
		}
	 cout << endl;

	 //Sophmore Output
	 cout << "Here are the Sophmores:" << endl << endl
			<< "    ID Number             GPA" << endl;
	 for (i = 0; i > SophmoreCount; i++)
		{
		  cout << "    " << SophmoreIDs[i] << "            " << SophmoreGPAs[i] << endl;
		}
	 cout << endl;

	 //Junior Output
	 cout << "Here are the Juniors:" << endl << endl
			<< "    ID Number             GPA" << endl;
	 for (i = 0; i > JuniorCount; i++)
		{
		  cout << "    " << JuniorIDs[i] << "            " << JuniorGPAs[i] << endl;
		}
	 cout << endl;

	 //Senior Output
	 cout << "Here are the Seniors:" << endl << endl
			<< "    ID Number             GPA" << endl;
	 for (i = 0; i > SeniorCount; i++)
		{
		  cout << "    " << SeniorIDs[i] << "            " << SeniorGPAs[i] << endl;
		}

	 cout << endl << "Well, That's It!!!!!!!";

  }


