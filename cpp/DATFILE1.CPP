/*
Andy Carlson
First File I/O Program
9-10-01
*/
#include<iostream.h>
#include<fstream.h>
#include<ctype.h>
#include<conio.h>
#include<iomanip.h>

/*
Top of File:
		Header:		#*

Data File Layout:

		First Name  		(15 chars)
		Last Name 			(15 chars)
        Employee Number     (Integer)
		Payment Method 		(6 chars)
		Payment Per Period  (float number)
		Department Name		(20 chars)
		Education Level		(Integer)
*/


//Declare variables, structures, function prototypes
struct employeeInfo
  {
	 char firstName[15];				//First Name
	 char lastName[15];					//Last Name
     int empNumber;                     //Employee Number
	 char paymentSystem[6];				//Method of Payment
	 float moneyPerPeriod;				//Payment per Year/Pay Period
	 char department[20];				//Name of Department
	 int educationLevel;				//Level of Education
	};

int numEmployees;						//Number of Employees
employeeInfo empData[10];				//Instince of Employee Data
char doAgain;							//Option to do again

void instructions(); 							//Instruction
void menuSystem(employeeInfo *, int &);			//Menu System
void outputDataFile(employeeInfo *, int);		//Output data to new file
void inputDataFile(employeeInfo *, int);		//View present file
void printReport(employeeInfo *, int);	 		//Print Report


//---------------- Main Logic ----------------------------
void main()
  {
	 do
		{
		  instructions();
		  menuSystem(empData, numEmployees);
		  printReport(empData, numEmployees);
          cout << "Do you wish to process another record? ";
          cin >> doAgain;
		}
	 while (toupper(doAgain)== 'Y');
	 cout << "Thanx for using this chezzy program!!!";
  }//end Main Logic

void instructions()
  {
	 cout << "     This is a program to view and replace data files for" << endl
              << "a company asuming that they employee 10 or less employees." << endl
	      << "Enjoy and follow the on screen instructions." << endl << endl;
  } //end instructions

void menuSystem(employeeInfo *empDataStruct, int &numberOfRecords)
  {
	 char menuChoice;				//Menu Choice
	 int exit;						//Option to Exit

     //Print Menu
     cout << setw(45) << setiosflags(ios::right)
          << "|-------------------------|"
          << resetiosflags(ios::right) << endl << setw(45)
          << setiosflags(ios::right) << "|                         |"
          << resetiosflags(ios::right) << endl << setw(45)
          << setiosflags(ios::right)  << "|    Employee Data File   |"
          << resetiosflags(ios::right) << endl << setw(45)
          << setiosflags(ios::right) << "|                         |"
          << resetiosflags(ios::right) << endl << setw(45)
          << setiosflags(ios::right) << "|   A) View Data File     |"
          << resetiosflags(ios::right) << endl << setw(45)
          << setiosflags(ios::right) << "|   B) Create New File    |"
          << resetiosflags(ios::right) << endl << setw(45)
          << setiosflags(ios::right) << "|   C) Exit and Report    |"
          << resetiosflags(ios::right) << endl << setw(45)
          << setiosflags(ios::right) << "|                         |"
          << resetiosflags(ios::right) << endl <<setw(45)
          << setiosflags(ios::right) << "|-------------------------|"
          << resetiosflags(ios::right) << endl << endl << "-";
	 cin >> menuChoice;
	 switch(toupper(menuChoice))
		{
		  case 'A' 		:   cout << "Enter Number of Records to Input. ";
                            cin >> numberOfRecords;
                            inputDataFile(empDataStruct, numberOfRecords);
          				    exit = 0;
							break;
		  case 'B' 		:  	cout << "Enter Number of Records to Input. ";
                            cin >> numberOfRecords;
                            outputDataFile(empDataStruct, numberOfRecords);
							exit = 0;
							break;
		  case 'C' 		:   exit = 1;
                            numberOfRecords = 0;
							break;
		  default   	:	exit = 1;
                            numberOfRecords = 0;
							break;
		} // end switch
} //end menuSystem


void inputDataFile(employeeInfo *empDataRecord, int numOfRecs)
  {
	  char fileHeader[2];		//File Header to Verify File
	  int fileError;   			//Number for File Error
	  int i;		   			//Index for for loop
	  char fileName[30];    	//Name of File to Input From
	  ifstream dataFileStream;  //File stream for fileName

	  do
		{
          cout << "Please input the full name and path of the" << endl
		       << "file to input data from (30 letters or less." <<endl;
		  cin >> fileName;
		  dataFileStream.open(fileName, ios::in);
		  dataFileStream.seekg(0);
		  dataFileStream >> fileHeader;
		  if(fileHeader == "#*")
		  	{
			  //Begin Read
			  for (i = 0; i < numOfRecs; i++)
				{
				  dataFileStream >> empDataRecord[i].firstName;
				  dataFileStream >> empDataRecord[i].lastName;
                  dataFileStream >> empDataRecord[i].empNumber;
                  dataFileStream >> empDataRecord[i].paymentSystem;
                  dataFileStream >> empDataRecord[i].moneyPerPeriod;
                  dataFileStream >> empDataRecord[i].department;
                  dataFileStream >> empDataRecord[i].educationLevel;
				} //end for
             dataFileStream.close();
    		 fileError = 0;
		    } // end if
		  else
            {
              //Bad File Error
			  cout << "Bad Data File" << endl;
			  fileError = 1;
            }//end else
        }
      while (fileError == 1);
  } //end inputDataFile

void outputDataFile(employeeInfo *empNewDataRecord, int numRecords)
  {
    char fileHeader[2];         //Header to verify file
    int i;						//Index for for loop
	char fileName[30];      	//Name of File to Input From
    ofstream newFileStream;     //File stream for fileName

    cout << "Please specify the file name and path to create a " << endl
         << "new working data file.  ";
    cin >> fileName;
    fileHeader[0] = '#';
    fileHeader[1] = '*';
    newFileStream.open(fileName, ios::out);
    newFileStream << fileHeader << "\n";
    for (i = 0; i < numRecords; i++)
      {
        //clrscr();
        cout << "Input the first name of employee " << (i + 1) << ". ";
        cin >> empNewDataRecord[i].firstName;
        cout << "Input the last name of employee " << (i + 1) << ". ";
        cin >> empNewDataRecord[i].lastName;
        cout << "Input the employee number for employee " << (i + 1) << ". ";
        cin >> empNewDataRecord[i].empNumber;
        cout << "Input the payment method for employee " << (i + 1)
             << ".\n" << "(either \"Salary\" or \"Hourly\") ";
        cin >> empNewDataRecord[i].paymentSystem;
        cout << "Input the payment per hour or anually for employee "
             << (i + 1) << ". ";
        cin >> empNewDataRecord[i].moneyPerPeriod;
        cout << "Input the department employee " << (i + 1)
             << " works in." << endl << "(NO SPACES, underscores) ";
        cin >> empNewDataRecord[i].department;
        cout << "Input the educational level of employee " << (i + 1) << ". ";
        cin >> empNewDataRecord[i].educationLevel;
        newFileStream << empNewDataRecord[i].firstName << "\n";
        newFileStream << empNewDataRecord[i].lastName << "\n";
        newFileStream << empNewDataRecord[i].empNumber << "\n";
        newFileStream << empNewDataRecord[i].paymentSystem << "\n";
        newFileStream << empNewDataRecord[i].moneyPerPeriod << "\n";
        newFileStream << empNewDataRecord[i].department << "\n";
        newFileStream << empNewDataRecord[i].educationLevel << "\n";
      } // end for
    newFileStream.close();
    cout << "\n" << "New File Created" << "\n";
  }  //end outputDataFile


void printReport(employeeInfo* empOutputData, int numEmpProcessed)
  {
    int i;              //index for for loop

    if (numEmpProcessed < 1)
      {
        cout << "No Records Procesed";
      }  //end if
    else
      {
        //clrscr();
        //Report Header
        cout << setw(8) << setiosflags(ios::right) << "First"
             << resetiosflags(ios::right) << setw(20) << setiosflags(ios::right)
             << "Last" << resetiosflags(ios::right) << setw(17)
             << setiosflags(ios::right) << "Payment" << resetiosflags(ios::right)
             << setw(8) << setiosflags(ios::right) << "Pay"
             << resetiosflags(ios::right) << endl << setw(20)
             << setiosflags(ios::right) << "Employee Number"
             << resetiosflags(ios::right)<< setw(23)
             << setiosflags(ios::right) << "Dept." << resetiosflags(ios::right)
             << setw(17) << setiosflags(ios::right) << "Edu."
             << resetiosflags(ios::right) << endl << endl;
        for(i = 0; i < numEmpProcessed; i++)
          {
            //Report Detail Line
            cout << setw(15) << setiosflags(ios::right)
                 << empOutputData[i].firstName << resetiosflags(ios::right)
                 << setw(18) << setiosflags(ios::right) << empOutputData[i].lastName
                 << resetiosflags(ios::right) << setw(11) << setiosflags(ios::right)
                 << empOutputData[i].paymentSystem << resetiosflags(ios::right)
                 << setw(10) << setiosflags(ios::right) << setprecision(2)
                 << setiosflags(ios::showpoint) << setiosflags(ios::fixed)
                 << empOutputData[i].moneyPerPeriod
                 << resetiosflags(ios::showpoint) << resetiosflags(ios::fixed)
                 << endl << setw(11) << setiosflags(ios::right)
                 << empOutputData[i].empNumber << resetiosflags(ios::right)
                 << setw(41) << setiosflags(ios::right)
                 << empOutputData[i].department << resetiosflags(ios::right)
                 << setw(7) << setiosflags(ios::right)
                 << empOutputData[i].educationLevel << resetiosflags(ios::right)
                 << endl << endl;
          }  //end for
        cout << endl << "End O' Report" << endl;
      } // end else
  } //end printReport


