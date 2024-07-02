#include <cstring.h>
#include <iostream.h>

class number
  {
	 private:
				string numberArray;
	 public:
				void getNumber()
				  {
					 cin >> numberArray;
				  }
				void putCommas()
				  {
					 int i;
					 for (i = numberArray.length(); i > -1; i = i - 3)
						{
						  if (i == numberArray.length())
							 continue;
						  else
							 numberArray.insert(i,',');
						}
				  }
				void printNum()
				  {
					 cout << endl << numberArray;
				  }
  };

void main()
  {
	 number num1;
	 num1.getNumber();
	 num1.putCommas();
	 num1.printNum();
  }
