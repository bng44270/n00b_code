 /*
Andy Carlson
8-29-01
Figure taxes/deductions and pay given the total amount earned and tax rates
*/

#include <iostream.h>
#include <iomanip.h>
#include <conio.h>
#include <ctype.h>

//Declare variables, structures, and function prototypes

struct empConstants
  {
    float guideFullDay,     //Guide wage for a full day
          guideHalfDay,     //Guide wage for a half day
          clerkHourlyPay;   //Clerk wage per hour
  };

struct guides
  {
    int fullDays,           //Number of Full Day Tours
        halfDays;           //Number of Half Day Tours
    float deductAmt,        //Amount of of Deductions
          grossPay,         //Pay before taxes
          netPay;           //Pay after taxes
  };

struct resClerk
  {
    int hourWorked;         //Number of Full Day Tours
    float deductAmt,        //Amount of of Deductions
          grossPay,         //Pay before taxes
          netPay;           //Pay after taxes
  };

struct deductions
  {
    float stateRate,        //State tax rate
          ficaRate,         //FICA tax rate
          federalRate,      //Federal tax rate
          healthIns,        //Amount deducted for health Ins.
          retireFund;       //Amount deducted for retirement fund
  };

char again;                 //option to run program again
empConstants empWages;      //Info on wages for employees
guides tourGuides[10];      //Array of tour guide info
resClerk tourClerk[10];     //Array of reservation clerk info
deductions wageDeduct;      //Holds all of the deduction info
int maxClerk,               //Maximum number of clerks to input
    maxGuide;               //Maximum number of guides to input

//Print instructions
void instruct();
//Input initial data
void inputInitial(deductions &, int &, int &, empConstants &);
//Input tour guide info
void processGuide(int , guides *, empConstants, deductions);
//Input clerk info
void processClerks(int , resClerk *, empConstants, deductions);
//Prints report data
void printReport(guides *, resClerk *, int, int, deductions, empConstants);


void main()
  {
    do
      {
        instruct();
        inputInitial(wageDeduct, maxClerk, maxGuide, empWages);
        processGuide(maxGuide, tourGuides, empWages, wageDeduct);
        processClerks(maxClerk, tourClerk, empWages, wageDeduct);
        printReport(tourGuides, tourClerk, maxClerk, maxGuide, wageDeduct, empWages);
        cout << "Do you wish to enter data and create another report? ";
        cin >> again;
      }
    while(toupper(again)=='Y');
    cout << endl << "Thank you for using this program!!!!";
  }

//Function Declarations

void instruct()
  {
    cout << "    Welcome to this really cool program.  It allows you to" << endl
         << "figure the payroll for a company with 10 Tour Guides and " << endl
         << "10 Reservation Clerks.  Simply follow the extremely simple" << endl
         << "on-screen instructions, and ENJOY!!!!!!!" << endl;
  } // end function instruct

void inputInitial(deductions &inputDeduct, int &mostClerk, int &mostGuide, empConstants &wageData)
  {
    cout << "Please enter the number of clerks to process ";
    cin >> mostClerk;
    cout << "Please enter the number of guides to process ";
    cin >> mostGuide;
    cout << "Please enter the State Tax Rate (ex. 0.03 for 3%) ";
    cin >> inputDeduct.stateRate;
    cout << "Please enter the FICA Tax Rate (ex. 0.03 for 3%) ";
    cin >> inputDeduct.ficaRate;
    cout << "Please enter the Federal Tax Rate (ex. 0.03 for 3%) ";
    cin >> inputDeduct.federalRate;
    cout << "Please enter the standard deduction for health" << endl
         << "insurance in dollars (ex. 34.45 for $34.45). ";
    cin >> inputDeduct.healthIns;
    cout << "Please enter the standard deduction for retirement" << endl
         << "fund in dollars (ex. 34.45 for $34.45). ";
    cin >> inputDeduct.retireFund;
    cout << "Please enter the pay a guide gets for a full day" << endl
         << "tour. ";
    cin >> wageData.guideFullDay;
    cout << "Please enter the pay a guide gets for a half day" << endl
         << "tour. ";
    cin >> wageData.guideHalfDay;
    cout << "Please enter the hourly wage of a reservation" << endl
         << "clerk. (ex. 5.54 for $5.54 / hr) ";
    cin >> wageData.clerkHourlyPay;
    //clrscr();

  } //end function inputInitial

void processGuide(int mostGuide, guides *guideInfo, empConstants wageData, deductions deductInfo)
  {
    int i;              //index for for loop
    for(i = 0; i < mostGuide; i++)
      {
        cout << "Please enter the number of full days guide #" << (i + 1)
             << " had. ";
        cin >> guideInfo[i].fullDays;
        cout << "Please enter the number of half days guide #" << (i + 1)
             << " had. ";
        cin >> guideInfo[i].halfDays;
        guideInfo[i].grossPay = (guideInfo[i].fullDays * wageData.guideFullDay)
                           + (guideInfo[i].halfDays * wageData.guideHalfDay);
        guideInfo[i].deductAmt = (guideInfo[i].grossPay * deductInfo.stateRate)
                            + (guideInfo[i].grossPay * deductInfo.ficaRate)
                            + (guideInfo[i].grossPay * deductInfo.federalRate)
                            + deductInfo.healthIns + deductInfo.retireFund;
        guideInfo[i].netPay = guideInfo[i].grossPay - guideInfo[i].deductAmt;
      } //end for
    //clrscr();
  } //end function processGuide

void processClerks(int mostClerks, resClerk *clerkData, empConstants wageData, deductions deductInfo)
  {
    int i;              //index for for loop
    for (i = 0; i < mostClerks; i++)
      {
        cout << "Please enter the number of hours clerk #" << (i + 1)
             << "worked. ";
        cin >> clerkData[i].hourWorked;
        clerkData[i].grossPay = clerkData[i].hourWorked * wageData.clerkHourlyPay;
        clerkData[i].deductAmt = (clerkData[i].grossPay * deductInfo.stateRate)
                            + (clerkData[i].grossPay * deductInfo.ficaRate)
                            + (clerkData[i].grossPay * deductInfo.federalRate)
                            + deductInfo.healthIns + deductInfo.retireFund;
        clerkData[i].netPay = clerkData[i].grossPay - clerkData[i].deductAmt;
      } // end for
    //clrscr();
  } //end function processClerks

void printReport(guides *guideData, resClerk *clerkData, int mostClerk, int mostGuide, deductions deductInfo, empConstants wageData)
  {
    int i;                  //index for for loop
    //clrscr();
    cout << "                      Report Data" << endl << endl
         << "Tour Guides       Full Day = $" << setprecision(2)
         << setiosflags(ios::showpoint) << setiosflags(ios::fixed)
         << wageData.guideFullDay << resetiosflags(ios::showpoint)
         << resetiosflags(ios::fixed) << "  Half Day = $" << setprecision(2)
         << setiosflags(ios::showpoint) << setiosflags(ios::fixed)
         << wageData.guideHalfDay << resetiosflags(ios::showpoint)
         << resetiosflags(ios::fixed) << endl
         << setw(5) << setiosflags(ios::right) << "No." << resetiosflags(ios::right)
         << setw(12) << setiosflags(ios::right) << "Full Days"  << resetiosflags(ios::right)
         << setw(13) << setiosflags(ios::right) << "Half Days" << resetiosflags(ios::right)
         << setw(10) << setiosflags(ios::right) << "Gross" << resetiosflags(ios::right)
         << setw(8) << setiosflags(ios::right) << "Net" << resetiosflags(ios::right)
         << setw(12) << setiosflags(ios::right) << "Deduct." << resetiosflags(ios::right)
         << endl << endl;
    for(i = 0; i < mostGuide; i++)
      {
        cout << setw(3) << setiosflags(ios::right) << (i + 1) << resetiosflags(ios::right)
             << setw(11) << setiosflags(ios::right) << guideData[i].fullDays << resetiosflags(ios::right)
             << setw(13) << setiosflags(ios::right) << guideData[i].halfDays << resetiosflags(ios::right)
             << setw(13) << setiosflags(ios::right) << setprecision(2)
             << setiosflags(ios::showpoint) << setiosflags(ios::fixed) << guideData[i].grossPay
             << resetiosflags(ios::right) << resetiosflags(ios::showpoint) << resetiosflags(ios::fixed)
             << setw(10) << setiosflags(ios::right) << setprecision(2)
             << setiosflags(ios::showpoint) << setiosflags(ios::fixed) << guideData[i].netPay
             << resetiosflags(ios::right) << resetiosflags(ios::showpoint) << resetiosflags(ios::fixed)
             << setw(10) << setiosflags(ios::right) << setprecision(2)
             << setiosflags(ios::showpoint) << setiosflags(ios::fixed) << guideData[i].deductAmt
             << resetiosflags(ios::right) << resetiosflags(ios::showpoint) << resetiosflags(ios::fixed)
             << endl;
      } // end for mostGuide
    cout << "Reservation Clerk      Hourly Wage = $" << setprecision(2)
         << setiosflags(ios::showpoint) << setiosflags(ios::fixed)
         << wageData.clerkHourlyPay << resetiosflags(ios::showpoint)
         << resetiosflags(ios::fixed) << endl
         << setw(5) << setiosflags(ios::right) << "No." << resetiosflags(ios::right)
         << setw(8) << setiosflags(ios::right) << "Hours" << resetiosflags(ios::right)
         << setw(10) << setiosflags(ios::right) << "Gross" << resetiosflags(ios::right)
         << setw(8) << setiosflags(ios::right) << "Net" << resetiosflags(ios::right)
         << setw(12) << setiosflags(ios::right) << "Deduct" << resetiosflags(ios::right)
         << endl << endl;
    for (i = 0; i < mostClerk; i++)
      {
        cout << setw(3) << setiosflags(ios::right) << (i + 1) << resetiosflags(ios::right)
             << setw(9) << setiosflags(ios::right) << clerkData[i].hourWorked << resetiosflags(ios::right)
             << setw(12) << setiosflags(ios::right) << setprecision(2)
             << setiosflags(ios::showpoint) << setiosflags(ios::fixed) << clerkData[i].grossPay
             << resetiosflags(ios::right) << resetiosflags(ios::showpoint) << resetiosflags(ios::fixed)
             << setw(9) << setiosflags(ios::right) << setprecision(2)
             << setiosflags(ios::showpoint) << setiosflags(ios::fixed) << clerkData[i].netPay
             << resetiosflags(ios::right) << resetiosflags(ios::showpoint) << resetiosflags(ios::fixed)
             << setw(10) << setiosflags(ios::right) << setprecision(2)
             << setiosflags(ios::showpoint) << setiosflags(ios::fixed) << clerkData[i].deductAmt
             << resetiosflags(ios::right) << resetiosflags(ios::showpoint) << resetiosflags(ios::fixed)
             << endl;
      } //end for mostClerks
    cout << endl << endl << "Thank you for using this cool report writer!!! :)";
  } // end function printReport

