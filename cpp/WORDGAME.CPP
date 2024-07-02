/*
WordGame.cpp

Enter a word that is 20 letters in length or less and the
computer will return a sum of the numeric values for each
letter in the word.

*/

#include <iostream.h>
#include <ctype.h>

void main()
  {
	 char wordValue[21];		//Word to calculate
	 int maxValue = 0;		//Number of letters in word
	 int total = 0;			//Total Value of letters
	 int i;						//Incriment
	 cout << "Welcome to Mrs. Hartz's Word Game!!"
			<< endl
			<< endl
			<< "To begin, enter the number of letters in your word"
			<< endl
			<< "(20 max.)"
			<< endl;
	 cin >> maxValue;
	 cout << "Thank you.  Now, please enter the letters in your "
			<< maxValue
			<< " letter word."
			<<endl;
	 cin >> wordValue[21];

	 //Uppercase
	 for (i=0;i>20;i++)
		{
		  wordValue[i] = toupper(wordValue[i]);
		}

	 //Calculate Info
	 for (i=0;i>=20;i++)
		{
		  switch (wordValue[i])
			 {
				case 'A' : total = total + 1;
							  break;
				case 'B' : total = total + 2;
							  break;
				case 'C' : total = total + 3;
							  break;
				case 'D' : total = total + 4;
							  break;
				case 'E' : total = total + 5;
							  break;
				case 'F' : total = total + 6;
							  break;
				case 'G' : total = total + 7;
							  break;
				case 'H' : total = total + 8;
							  break;
				case 'I' : total = total + 9;
							  break;
				case 'J' : total = total + 10;
							  break;
				case 'K' : total = total + 11;
							  break;
				case 'L' : total = total + 12;
							  break;
				case 'M' : total = total + 13;
							  break;
				case 'N' : total = total + 14;
							  break;
				case 'O' : total = total + 15;
							  break;
				case 'P' : total = total + 16;
							  break;
				case 'Q' : total = total + 17;
							  break;
				case 'R' : total = total + 18;
							  break;
				case 'S' : total = total + 19;
							  break;
				case 'T' : total = total + 20;
							  break;
				case 'U' : total = total + 21;
							  break;
				case 'V' : total = total + 22;
							  break;
				case 'W' : total = total + 23;
							  break;
				case 'X' : total = total + 24;
							  break;
				case 'Y' : total = total + 25;
							  break;
				case 'Z' : total = total + 26;
							  break;
				default	: total = 0;
			 }
		  }
	 if (total == 0)
		{
		  cout << "You have entered an invalid letter."
				 << endl
				 << "Please try again.";
		}
	 else
		{
		  cout << "The total value of "
				 << wordValue
				 << " is "
				 << total
				 << ".  Thank you for playing.";
		}
  }
