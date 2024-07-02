#include <iostream.h>
#include <cstring.h>
#include <ctype.h>
#include <conio.h>
#include <iomanip.h>

/*
Publication Classes

by Andy Carlson

Does books and tapes
*/
//----------------------------------------------------------------------------
//Class Publication
//Base to publication2
class publication
  {
	 private:
					string pubTitle;						//Title of publication
					float pubPrices;			       	//Price of publication
	 public:
					void putData()				 	//Puts data in storage
					  {
						 cout << "Please enter the title. (Use Underscores) ";
						 cin >> pubTitle;
						 cout << "Please enter the price. ";
						 cin >> pubPrices;
					  } //end putData
					void getData()					//Gets data from storage
					  {
						 cout << "Title:" << setw(17) << setiosflags(ios::right)
								<< pubTitle << resetiosflags(ios::right) << endl
								<< "Price:" << setw(17)
										  << setiosflags(ios::right) << "$"
                                << resetiosflags(ios::right) << setprecision(2)
								<< setiosflags(ios::fixed) << pubPrices
								<< resetiosflags(ios::fixed) << endl;
					  } //end getData
  }; //class pulication
//-----------------------------------------------------------------------------
//Class publications2
//Derived from publication
//Base to book and tape
class publication2 : public publication
  {
	 private:
					string pubDate;				//Date of publication
	 public:
					void putData()					//Puts data in storage
					  {
						 publication::putData();
						 cout << "Please enter the publication date. ";
						 cin >> pubDate;
					  } //end putData
					void getData()					//Gets data from storage
					  {
						 publication::getData();
						 cout << "Publication Date:" << setw(6)
								<< setiosflags(ios::right) << pubDate
								<< resetiosflags(ios::right) << endl;
					  } //end getData
  }; //class publication2
//-----------------------------------------------------------------------------
//Class book
//Derived from publication2
class book : public publication2
  {
	 private:
					int pageCount;					//Page count of book
	 public:
					void putData()					//Puts Data into storage
					  {
						 publication2::putData();
						 cout << "Please enter the page count. ";
						 cin >> pageCount;
					  } //end putData
					void getData()					//Gets data from storage
					  {
						 publication2::getData();
						 cout << "Page Count:" << setw(12)
                              << setiosflags(ios::fixed)
                              << setiosflags(ios::right)
							  << pageCount << resetiosflags(ios::fixed)
                              << resetiosflags(ios::right) << endl;
					  } //end getData
  }; //class book
//-----------------------------------------------------------------------------
//Class tape
//Derived from publication2
class tape : public publication2
  {
	 private:
					float playingTime;			//Time the tape plays for
	 public:
					void putData()					//Puts data in storage
					  {
						 publication2::putData();
						 cout << "Please enter the playing time. (Minutes) ";
						 cin >> playingTime;
					  } //end putData
					void getData()					//Gets data from storage
					  {
						 publication2::getData();
						 cout << "Playing Time:" << setw(10)
								<< setiosflags(ios::fixed)
                                << setiosflags(ios::right)
								<< playingTime << resetiosflags(ios::fixed)
								<< resetiosflags(ios::right) << " min." << endl;
					  }
  }; //class tape
//-----------------------------------------------------------------------------
//Main Logic
//-----------------------------------------------------------------------------
//Function Prototype
void menuSystemReport();			//Menu for options

void main()
  {
	 menuSystemReport();
	 cout << endl << "Thanx for using this program";
  } //end main
//-----------------------------------------------------------------------------
void menuSystemReport()
  {
	 //Variable Declaration
	 struct pubs						//Structure of Publications
		{
		  tape tapes[10];				//Instance of tape class
		  book books[10];          //Instance of book class
		};
	 pubs pubEntryData; 			//Usable structure of publications
	 char doAgain;					//Option for user to continue
	 int tapeCount;				//Number of tapes -- Max 10
	 int bookCount;				//Number of books -- Max 10
	 int i;							//intex for report loops

	 tapeCount = 0;
	 bookCount = 0;
	 do
		{
		  clrscr();
		  cout << "(B)ook -- (T)ape -- (R)eport -->";
		  cin >> doAgain;
		  switch (toupper(doAgain))
			 {
				case 'B' : if (bookCount > 9)
								 cout << "Potential Overflow" << endl;
							  else
								 {
									pubEntryData.books[bookCount].putData();
									bookCount++;
								 }
							  //end if
							  break;
				case 'T' : if (tapeCount > 9)
								 cout << "Potential Overflow" << endl;
							  else
								 {
									pubEntryData.tapes[tapeCount].putData();
									tapeCount++;
								 }
							  //end if
							  break;
				case 'R' : break;
				default  : cout << "Invalid Entry" << endl;
							  break;
			 } //end switch
		}
	 while (toupper(doAgain) != 'R');

	 //Tape Report
	 for (i = 0; i < tapeCount; i++)
		{
		  cout << "Tape " << (i + 1) << endl << endl;
		  pubEntryData.tapes[i].getData();
		}

	 //Book Report
	 for (i = 0; i < bookCount; i++)
		{
		  cout << "Book " << (i + 1) << endl << endl;
		  pubEntryData.books[i].getData();
		}
  } //end menuSystemReport

