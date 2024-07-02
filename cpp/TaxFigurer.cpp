/*
Tax Figurer

by Andy Carlson

4-14-01
*/
#include <iostream.h>
#include <iomanip.h>
#include <ctype.h>

//Variables
float Tax,          //Tax added to Income
      Income,       //Income without tax
      GrossIncome;  //Income after deducting tax
char DoAgain = 'Y'; //Option to go again

//Function Prototypes
void Instructions();                        //Prints instructions
void TaxFigurer(float *, float *, float *); //Figures Tax on Imcome
void PrintData(float, float, float);        //Prints Data

void main()
  {
    while (toupper(DoAgain)=='Y')
      {
        Instructions();
        TaxFigurer(Income, Tax, GrossImcome);
        PrintData(Income, Tax, GrossIncome);
        cout << "Do You Wish to Figure Tax Again? (Y/N) ";
        cin >> DoAgain;
      } // end while
  } //end main

//Function Declarations

void Instructions()
  {
    cout << "   Welcome to this cool program that will allow" << endl
         << "you to enter an income and figure the tax and" << endl
         << "gross income after tax.  Enjoy!!" << endl << endl;
  } // end instructions

void TaxFigurer(float *ImcomeAmt, float *TaxAmt, float *GrossAmt)
  {
    cout << "Please enter your income.  ";
    cin >> IncomeAmt;

    if (IncomeAmt > 60000)
      {
        //Over $60,000
        TaxAmt = (IncomeAmt * .35) + 5000;
        GrossAmt = ImcomeAmt - TaxAmt;
      }
    else
    if (IncomeAmt > 40000)
      {
        //From 40,001 - $60,000
        TaxAmt = (IncomeAmt * .2) + 2000;
        GrossAmt = ImcomeAmt - TaxAmt;
      }
    else
    if (IncomeAmt > 20000)
      {
        //From 20,001 - 40,000
        TaxAmt = ImcomeAmt * .1;
        GrossAmt = IncomeAmt - TaxAmt;
      }
    else
    if (IncomeAmt > 10000)
      {
        //From 10,001 - 20,000
        TaxAmt = IncomeAmt * .05;
        GrossAmt = ImcomeAmt - TaxAmt;
      }
    else
    if (IncomeAmt > 0)
      {
        //Under 10,000
        TaxAmt = 0;
        GrossAmt = IncomeAmt;
      }
    else
      //Error Handler
      TaxAmt = -1;
    // end if
  }

void PrintData (float ImcomeAmt, float TaxAmt, float GrossAmt);
  {
    if (TaxAmt > 0)
      {
        //Normal Tax Output
        cout << "With $" << setprecision(2) << setiosflags(ios::fixed)
             << setiosflags(ios::showpoint) << IncomeAmt
             << resetiosflags(ios::fixed) << resetiosflags(ios::showpoint)
             << " in income and $" << setprecision(2) << setiosflags(ios::fixed)
             << setiosflags(ios::showpoint) << TaxAmt
             << resetiosflags(ios::fixed) << resetiosflags(ios::showpoint)
             << " in taxes, your Gross Income is $" << setprecision(2) << setiosflags(ios::fixed)
             << setiosflags(ios::showpoint) << GrossAmt
             << resetiosflags(ios::fixed) << resetiosflags(ios::showpoint)
             << end;
      }
    else
    if (TaxAmt == 0)
      {
        //No Taxes Output
        cout << "Oh, Happy Day!!! YOU DON'T PAY TAXES!!!!!" << endl;
      }
    else
      //Error Output
      cout "You somehow didn't enter data right." << endl;
    // end if
  }


