#include <iostream.h>
#include <ctype.h>
#include <fstream.h>

void main()
 {
	ifstream originalFile;
	ofstream safeFile;
	const int fileSize=10000;
	char fileName[21];
	char oFileContents[fileSize];
	cout << "Enter a file to safe-iffy  > ";
	cin.getline(fileName,20);
	originalFile.open(fileName,ios::in);
   close(fileName);
	//first=toascii(45);
	//cout << first;
 }
