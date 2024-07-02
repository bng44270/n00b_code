#include "hwcmpnt.h"
#include <iostream.h>

xorGate myXorGate;
andGate myAndGate;
orGate myOrGate;
norGate myNorGate;
nandGate myNandGate;

int gateTmp;

void main()
  {
	 cout << "Welcome to Ace E's Logic Gate Emulator" <<  endl << endl
	      << "This is a cheezy example of how logic gates work." << endl
			<< "The gates that will be used are the AND, OR, NOR," << endl
			<< "NAND, and XOR gates.  Enjoy." << endl << endl;
	 do
		{
		  cout << "Please select the gate to use" << endl
				 << "1 - AND" << endl
				 << "2 - OR" << endl
				 << "3 - NOR" << endl
				 << "4 - NAND" << endl
				 << "5 - XOR" << endl
				 << "6 - Exit" << endl;
		  cout << ">";
		  cin >> gateTmp;
		  switch (gateTmp)
			 {
				case 1 : cout << "Enter input #1 "; cin >> gateTmp; myAndGate.setLineInOne(gateTmp);
							cout << "Enter input #2 "; cin >> gateTmp; myAndGate.setLineInTwo(gateTmp);
							cout << "Output is " << myAndGate.getAndOut() << endl;
							break;
				case 2 : cout << "Enter input #1 "; cin >> gateTmp; myOrGate.setLineInOne(gateTmp);
							cout << "Enter input #2 "; cin >> gateTmp; myOrGate.setLineInTwo(gateTmp);
							cout << "Output is " << myOrGate.getOrOut() << endl;
							break;
				case 3 : cout << "Enter input #1 "; cin >> gateTmp; myNorGate.setLineInOne(gateTmp);
							cout << "Enter input #2 "; cin >> gateTmp; myNorGate.setLineInTwo(gateTmp);
							cout << "Output is " << myNorGate.getNorOut() << endl;
							break;
				case 4 : cout << "Enter input #1 "; cin >> gateTmp; myNandGate.setLineInOne(gateTmp);
							cout << "Enter input #2 "; cin >> gateTmp; myNandGate.setLineInTwo(gateTmp);
							cout << "Output is " << myNandGate.getNandOut() << endl;
							break;
				case 5 : cout << "Enter input #1 "; cin >> gateTmp; myXorGate.setLineInOne(gateTmp);
							cout << "Enter input #2 "; cin >> gateTmp; myXorGate.setLineInTwo(gateTmp);
							cout << "Output is " << myXorGate.getXorOut() << endl;
							break;
			 } //switch
		}
	 while (gateTmp != 6);
	 cout << "Thank you for using this program! :)" << endl;
  }
