/*
BochsEdit

by Ace E.

Began:       9-3-01
Completed:

Purpose:  provide an easy to use front end for editing the
			 bochsrc.txt file and giving the user the luxury
			 of using only ONE bochsrc file.
*/
#include <iostream.h>
#include <fstream.h>
#include <iomanip.h>
#include <ctype.h>
#include <conio.h>

//Declare structures, variables, and function prototypes
//******************************************************
class srcFileAndOperations
  {
	 private:
				struct fileData		  	 //Data to be stored in bochsrc.txt file
				  {
					 char fileHeader[19];		//File Header
					 char ramPre[7];				//Characters that come before amt
														//of RAM
					 int RAM;						//Amount of RAM
					 char biosPre[17];			//Characters that come before BIOS
					 char biosImage[46];			//Name of BIOS Image File
					 char biosAddress[18];		//Trailer for BIOS, includes Address
					 char vgaBIOSPre[14];		//Characters that come before VGA BIOS
					 char vgaBIOSImage[46];		//Name of VGA BIOS Image File
					 char floppyAPre[16];		//Characters that come before Floppy
														//Image Drive A
					 char floppyImageA[46];		//Name of Floppy Drive A Image File
					 char floppyAStatus[18]; 	//Trailer for Floppy Drive A, includes
														//status of disk (inserted)
					 char floppyBPre[16];		//Characters that come before Floppy
														//Image Drive B
					 char floppyImageB[46];		//Name of Floppy Drive B Image File
					 char floppyBStatus[18];	//Trailer for Floppy Drive B, includes
														//status of disk (inserted)
					 char hardDriveCPre[14];	//Characters that come before Drive C
														//Image File
					 char hardDriveCImage[46];	//Name of Hard Drive C Image File
					 char hardDriveCCylPre[7];	//Character that come before number of
														//cylinders on Drive C
					 int hardDriveCCyl;			//Number of Cylinders on Drive C
					 char hardDriveCHeadsPre[9];
														//Character that come before number of
														//heads on Drive C
					 int hardDriveCHeads;		//Number of Heads on Drive C
					 char hardDriveCSptPre[7];	//Character that come before number of
														//sectors per track on Drive C
					 int hardDriveCSpt;			//Number of sectors per track on
														//Drive C
					 char hardDriveDPre[14];	//Characters that come before Drive D
														//Image File
					 char hardDriveDImage[46];	//Name of Hard Drive D Image File
					 char hardDriveDCylPre[7];	//Character that come before number of
														//cylinders on Drive D
					 int hardDriveDCyl;			//Number of Cylinders on Drive D
					 char hardDriveDHeadsPre[9];
														//Character that come before number of
														//heads on Drive D
					 int hardDriveDHeads;		//Number of Heads on Drive D
					 char hardDriveDSptPre[7];	//Character that come before number of
														//sectors per track on Drive D
					 int hardDriveDSpt;			//Number of sectors per track on
														//Drive D
					 char cdromImagePre[14];	//Characters that come before CD-ROM
														//Image File
					 char bootDrivePre[8];		//Characters that come before
														//boot drive
					 char bootDrive;				//Boot Drive
				  } //end struct fileData
	 public:
				//Method Prototypes

  };  //end Class srcFileAndOperations


//******************************************************
//**************Begin Main Logic************************
void main()
  {
  }

//******************************************************
//**************Begin Modular Logic ********************

//******************************************************
