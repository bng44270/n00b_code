/*
Binary Adding Machine Source Code

by Ace E. Rawker
(P) 2002
*/

#include "hwcmpnt.h"
#include <iostream.h>

fullBinAdder myBA;
int addTmp;

void main()
  {
	 cout << "L1=";
	 cin >> addTmp;
	 myBA.setLineInOne(addTmp);
	 cout << "L2=";
	 cin >> addTmp;
	 myBA.setLineInTwo(addTmp);
	 cout << "CI=";
	 cin >> addTmp;
	 myBA.setCarryIn(addTmp);
	 cout << "S=" << myBA.getSumOut() << " CO=" << myBA.getCarryOut();
  }
