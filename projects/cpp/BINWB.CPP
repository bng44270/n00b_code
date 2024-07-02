/*
Binary Workbench

by Ace E. Rawker

(P) 2002
*/
#include <iostream.h>
#include "stdadds.h"

int values[10];
int valIdx;
char cmd[4];

void dispVal(int);
void parseCmd();
void initVals();
void showHelp();

void main()
  {
	 cout << "Ace E's Binary Workbench" << endl << endl;
	 for (int i = 0; i < 10; i++)
		values[i] = 0;

	 do
		{
		  cout << ">";  cin >> cmd;
		  parseCmd();
		}
	 while (toupper(cmd[0]) != 'Q');
  }

void parseCmd()
  {
	 int arg[3];

	 if ((toupper(cmd[0]) == 'V') && (toupper(cmd[1]) == 'A') && (toupper(cmd[2]) == 'L'))
		{
		  cout << "Figure # "; cin >> arg[0];
		  dispVal(arg[0]);
		}
	 else if ((toupper(cmd[0]) == 'A') && (toupper(cmd[1]) =='N') && (toupper(cmd[2]) == 'D'))
		{
		  cout << "Figure # "; cin >> arg[0];
		  cout << "AND Value "; cin >> arg[1];
		  values[arg[0]] = values[arg[0]] & arg[1];
		  cout << "ANDed Value of " << arg[0] << ": " << values[arg[0]] << endl;
		}
	 else if ((toupper(cmd[0]) == 'O') && (toupper(cmd[1]) =='R'))
		{
		  cout << "Figure # "; cin >> arg[0];
		  cout << "OR Value "; cin >> arg[1];
		  values[arg[0]] = values[arg[0]] | arg[1];
		  cout << "ORed Value of " << arg[0] << ": " << values[arg[0]] << endl;
		}
	 else if ((toupper(cmd[0]) == 'X') && (toupper(cmd[1]) =='O') && (toupper(cmd[2]) == 'R'))
		{
		  cout << "Figure # "; cin >> arg[0];
		  cout << "XOR Value "; cin >> arg[1];
		  values[arg[0]] = values[arg[0]] ^ arg[1];
		  cout << "XORed Value of " << arg[0] << ": " << values[arg[0]] << endl;
		}
	 else if ((toupper(cmd[0]) == 'N') && (toupper(cmd[1]) =='O') && (toupper(cmd[2]) == 'T'))
		{
		  cout << "Figure # "; cin >> arg[0];
		  values[arg[0]] = ~values[arg[0]];
		  cout << "NOTed Value of " << arg[0] << ": " << values[arg[0]] << endl;
		}
	 else if ((toupper(cmd[0]) == 'S') && (toupper(cmd[1]) =='H') && (toupper(cmd[2]) == 'L'))
		{
		  cout << "Figure # "; cin >> arg[0];
		  cout << "Bit Width "; cin >> arg[1];
		  values[arg[0]] = values[arg[0]] << arg[1];
		  cout << "Shifted Value of " << arg[0] << " : " << values[arg[0]] << endl;
		}
	 else if ((toupper(cmd[0]) == 'S') && (toupper(cmd[1]) =='H') && (toupper(cmd[2]) == 'R'))
		{
		  cout << "Figure # "; cin >> arg[0];
		  cout << "Bit Width "; cin >> arg[1];
		  values[arg[0]] = values[arg[0]] >> arg[1];
		  cout << "Shifted Value of " << arg[0] << ": " << values[arg[0]] << endl;
		}
	 else if ((toupper(cmd[0]) == 'I') && (toupper(cmd[1]) =='N') && (toupper(cmd[2]) == 'I'))
		{
		  for (int i = 0; i < 10; i++)
			 {
				values[i] = 0;
			 }
		  cout << "Values Initialized" << endl;
		}
	 else if ((toupper(cmd[0]) == 'I') && (toupper(cmd[1]) =='N') && (toupper(cmd[2]) == 'P'))
		{
		  cout << "Figure # "; cin >> arg[0];
		  cout << "New Value "; cin >> arg[1];
		  values[arg[0]] = arg[1];
		  cout << "New Value of " << arg[0] << ": " << values[arg[0]] << endl;
		}
     else if ((toupper(cmd[0]) == 'A') && (toupper(cmd[1]) =='D') && (toupper(cmd[2]) == 'D'))
        {
   		  cout << "Figure # "; cin >> arg[0];
		  cout << "Value to add "; cin >> arg[1];
		  values[arg[0]] += arg[1];
		  cout << "New Value of " << arg[0] << ": " << values[arg[0]] << endl;
        }
	 else if (toupper(cmd[0]) == 'H')
		showHelp();
	 else if (toupper(cmd[0]) == 'Q')
		;
	 else
		cout << "Invalid Operation" << endl;
  }

void showHelp()
  {
	 cout << "Command Help" << endl
			<< "  AND -- Performs XOR Operation on specified cell" << endl
			<< "  OR  -- Performs OR  Operation on specified cell" << endl
			<< "  XOR -- Performs XOR Operation on specified cell" << endl
			<< "  NOT -- Performs NOT Operation on specified cell" << endl
			<< "  SHL -- Shifts a specified cell a specified bits left" << endl
			<< "  SHR -- Shifts a specified cell a specified bits right" << endl
            << "  ADD -- Adds a specified value to a specified cell" << endl
			<< "  INI -- Initializes data in all cells to zero" << endl
			<< "  INP -- Allows input of data into a specified cell" << endl
			<< "  H   -- This help screen" << endl
         << "  Q   -- Quit" << endl;
  }

void dispVal(int idx)
  {
	 cout << "HEX: " << dec2hex(values[idx]).getByIdx(0)
			<< dec2hex(values[idx]).getByIdx(1) << "   BIN: "
			<< dec2bin(values[idx]).getByIdx(0) << dec2bin(values[idx]).getByIdx(1)
			<< dec2bin(values[idx]).getByIdx(2) << dec2bin(values[idx]).getByIdx(3)
			<< dec2bin(values[idx]).getByIdx(4) << dec2bin(values[idx]).getByIdx(5)
			<< dec2bin(values[idx]).getByIdx(6) << dec2bin(values[idx]).getByIdx(7)
			<< "   ASCII: " << dec2asc(values[idx])
			<< "   DEC: " << values[idx] << endl;
  }



