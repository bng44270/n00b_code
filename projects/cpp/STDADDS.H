/*
Ace E's C++ Addons

usefull classes

(P) 2002

classes included:

stack
range
aString

functions included:

dec2hex
dec2asc
dec2bin
asc2hex
asc2bin
asc2dec
hex2bin
hex2dec
hex2asc
bin2dec
bin2asc
bin2hex

*/
#include <ctype.h>	 //need toupper and toascii function
#include <string.h>  //need basic string functions for aString

//********************************************************************
//*******************  Class Area  ***********************************
//********************************************************************

//class stack : stores 8-bit character value, allows you to
//     change ss and sp (Assembly Language Kinda)
class stack
  {
	 private:
		char stackArea[255];
		int sp;
		int ss;
	 public:
		stack() : ss(255), sp(-1)
		  {  }
		void push(char i)
		  {
			 if (sp != ss)
				stackArea[++sp] = i;
			 //endif
		  }
		char pop()
		  {
			 if (sp > 0)
				return stackArea[sp--];
		  }
		int getSS()
		  {
			 return ss;
		  }
		void setSS(int s)
		  {
			 if ((s > 0) && (s < 256))
				ss = s;
		  }
		int getSP()
		  {
			 return sp;
		  }
		void setSP(int s)
		  {
			 if ((s > 0) && (s < ss))
				sp = s;
		  }
  }; //class stack


//class range : is used to test variables to see if they are
//      within a range of numbers
class range
  {
	 private:
		double top,
				 bottom;
	 public:
		range() : top(0), bottom(0)
		  {  }
		range(double b, double t) : top(t), bottom(b)
		  {  }
		void setTop(double t)
		  {
			 top = t;
		  }
		void setBottom(double b)
		  {
			 bottom = b;
		  }
		double getBottom()
		  {
			 return bottom;
		  }
		double getTop()
		  {
			 return top;
		  }
		int inRange(double tmp)
		  {
			 if ((tmp >= bottom) && (tmp <=  top))
				return 1;
			 else
				return 0;
			 //endif
		  }
  }; //class range

//class aString : just another bare-bones C++ string
//     (needed for number conversions, will work for anything)
class aString
  {
	 private:
		char strVal[255];
	 public:
		aString()
		  {
			 for (int i = 0; i < 256; i++)
				strVal[i] = ' ';
		  }
		aString(char tmp[])
		  {
			 strcpy(strVal,tmp);
		  }
		char getByIdx(int i)
		  {
			 if (i < 256)
				return strVal[i];
		  }
		void setByIdx(int i, char tmp)
		  {
			 if (i < 256)
				strVal[i] = tmp;
		  }
		aString operator + (aString s) const
		  {
			 aString tmp;
			 if (strlen(strVal) + strlen(s.strVal) < 256)
				{
				  strcpy(tmp.strVal, strVal);
				  strcat(tmp.strVal, s.strVal);
				}
			 return tmp;
		  }
  };


//********************************************************************
//*******************  Function Area  ********************************
//********************************************************************

char dec2asc(int decTmp)
  {
	 return toascii(decTmp);
  }

int asc2dec(char ascTmp)
  {
	 int decVal;
	 for (int i = 0; i < 256; i++)
		if (ascTmp == toascii(i))
		  {
			 decVal = i;
			 i = 255;
		  }
	 return decVal;
  }

//

aString dec2hex(int decTmp)
  {
	 int h1,
		  h2;
	 aString hexTmp;

	 h2 = decTmp / 16;
	 h1 = decTmp % 16;

	 switch (h2)
		{
		  case 0 : hexTmp.setByIdx(0,'0'); break;
		  case 1 : hexTmp.setByIdx(0,'1'); break;
		  case 2 : hexTmp.setByIdx(0,'2'); break;
		  case 3 : hexTmp.setByIdx(0,'3'); break;
		  case 4 : hexTmp.setByIdx(0,'4'); break;
		  case 5 : hexTmp.setByIdx(0,'5'); break;
		  case 6 : hexTmp.setByIdx(0,'6'); break;
		  case 7 : hexTmp.setByIdx(0,'7'); break;
		  case 8 : hexTmp.setByIdx(0,'8'); break;
		  case 9 : hexTmp.setByIdx(0,'9'); break;
		  case 10 : hexTmp.setByIdx(0,'A'); break;
		  case 11 : hexTmp.setByIdx(0,'B'); break;
		  case 12 : hexTmp.setByIdx(0,'C'); break;
		  case 13 : hexTmp.setByIdx(0,'D'); break;
		  case 14 : hexTmp.setByIdx(0,'E'); break;
		  case 15 : hexTmp.setByIdx(0,'F'); break;
		}

	 switch (h1)
		{
		  case 0 : hexTmp.setByIdx(1,'0'); break;
		  case 1 : hexTmp.setByIdx(1,'1'); break;
		  case 2 : hexTmp.setByIdx(1,'2'); break;
		  case 3 : hexTmp.setByIdx(1,'3'); break;
		  case 4 : hexTmp.setByIdx(1,'4'); break;
		  case 5 : hexTmp.setByIdx(1,'5'); break;
		  case 6 : hexTmp.setByIdx(1,'6'); break;
		  case 7 : hexTmp.setByIdx(1,'7'); break;
		  case 8 : hexTmp.setByIdx(1,'8'); break;
		  case 9 : hexTmp.setByIdx(1,'9'); break;
		  case 10 : hexTmp.setByIdx(1,'A'); break;
		  case 11 : hexTmp.setByIdx(1,'B'); break;
		  case 12 : hexTmp.setByIdx(1,'C'); break;
		  case 13 : hexTmp.setByIdx(1,'D'); break;
		  case 14 : hexTmp.setByIdx(1,'E'); break;
		  case 15 : hexTmp.setByIdx(1,'F'); break;
		}

	 return hexTmp;
  }

int hex2dec(aString hexTmp)
  {
	 int decTmp = 0;

	 switch (hexTmp.getByIdx(1))
		{
		  case '0' : decTmp += 0;  break;
		  case '1' : decTmp += 1;  break;
		  case '2' : decTmp += 2;  break;
		  case '3' : decTmp += 3;  break;
		  case '4' : decTmp += 4;  break;
		  case '5' : decTmp += 5;  break;
		  case '6' : decTmp += 6;  break;
		  case '7' : decTmp += 7;  break;
		  case '8' : decTmp += 8;  break;
		  case '9' : decTmp += 9;  break;
		  case 'A' : decTmp += 10;  break;
		  case 'B' : decTmp += 11;  break;
		  case 'C' : decTmp += 12;  break;
		  case 'D' : decTmp += 13;  break;
		  case 'E' : decTmp += 14;  break;
		  case 'F' : decTmp += 15;  break;
		}

	 switch (hexTmp.getByIdx(0))
		{
		  case '0' : decTmp += 0;  break;
		  case '1' : decTmp += 16;  break;
		  case '2' : decTmp += 32;  break;
		  case '3' : decTmp += 48;  break;
		  case '4' : decTmp += 64;  break;
		  case '5' : decTmp += 80;  break;
		  case '6' : decTmp += 96;  break;
		  case '7' : decTmp += 112;  break;
		  case '8' : decTmp += 128;  break;
		  case '9' : decTmp += 144;  break;
		  case 'A' : decTmp += 160;  break;
		  case 'B' : decTmp += 176;  break;
		  case 'C' : decTmp += 192;  break;
		  case 'D' : decTmp += 208;  break;
		  case 'E' : decTmp += 224;  break;
		  case 'F' : decTmp += 240;  break;
		}

	 return decTmp;
  }

aString dec2bin(int decTmp)
  {
	 aString binTmp;

	 //msb
	 if (decTmp >= 128)
		{
		  decTmp -= 128;
		  binTmp.setByIdx(0,'1');
		}
	 else
		binTmp.setByIdx(0,'0');

	 if (decTmp >= 64)
		{
		  decTmp -= 64;
		  binTmp.setByIdx(1,'1');
		}
	 else
		binTmp.setByIdx(1,'0');

	 if (decTmp >= 32)
		{
		  decTmp -= 32;
		  binTmp.setByIdx(2,'1');
		}
	 else
		binTmp.setByIdx(2,'0');

	 if (decTmp >= 16)
		{
		  decTmp -= 16;
		  binTmp.setByIdx(3,'1');
		}
	 else
		binTmp.setByIdx(3,'0');

	 if (decTmp >= 8)
		{
		  decTmp -= 8;
		  binTmp.setByIdx(4,'1');
		}
	 else
		binTmp.setByIdx(4,'0');

	 if (decTmp >= 4)
		{
		  decTmp -= 4;
		  binTmp.setByIdx(5,'1');
		}
	 else
		binTmp.setByIdx(5,'0');

	 if (decTmp >= 2)
		{
		  decTmp -= 2;
		  binTmp.setByIdx(6,'1');
		}
	 else
		binTmp.setByIdx(6,'0');

	 if (decTmp == 1)
		binTmp.setByIdx(7,'1');
	 else
		binTmp.setByIdx(7,'0');

	 return binTmp;
  }

int bin2dec(aString binTmp)
  {
	 int decTmp = 0;

	 if (binTmp.getByIdx(0) == '1')
		decTmp += 128;
	 if (binTmp.getByIdx(1) == '1')
		decTmp += 64;
	 if (binTmp.getByIdx(2) == '1')
		decTmp += 32;
	 if (binTmp.getByIdx(3) == '1')
		decTmp += 16;
	 if (binTmp.getByIdx(4) == '1')
		decTmp += 8;
	 if (binTmp.getByIdx(5) == '1')
		decTmp += 4;
	 if (binTmp.getByIdx(6) == '1')
		decTmp += 2;
	 if (binTmp.getByIdx(7) == '1')
		decTmp += 1;

	  return decTmp;
  }

aString asc2hex(char ascTmp)
  {
	 aString hexTmp;
	 int decTmp;

	 decTmp = asc2dec(ascTmp);
	 hexTmp = dec2hex(decTmp);

	 return hexTmp;
  }

aString asc2bin(char ascTmp)
  {
	 aString binTmp;
	 int decTmp;

	 decTmp = asc2dec(ascTmp);
	 binTmp = dec2bin(decTmp);

	 return binTmp;
  }

aString bin2hex(aString binTmp)
  {
	 int decTmp;
	 aString hexTmp;

	 decTmp = bin2dec(binTmp);
	 hexTmp = dec2hex(decTmp);

	 return hexTmp;
  }

aString hex2bin(aString hexTmp)
  {
	 aString binTmp;
	 int decTmp;

	 decTmp = hex2dec(hexTmp);
	 binTmp = dec2bin(decTmp);

	 return binTmp;
  }

char hex2asc(aString hexTmp)
  {
	 char ascTmp;
	 int decTmp;

	 decTmp = hex2dec(hexTmp);
	 ascTmp = dec2asc(decTmp);

	 return ascTmp;
  }

char bin2asc(aString binTmp)
  {
	 char ascTmp;
	 int decTmp;

	 decTmp = bin2dec(binTmp);
	 ascTmp = dec2asc(decTmp);

	 return ascTmp;
  }
