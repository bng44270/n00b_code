Program YearAgeFinder(Input, Output);

{******************************************************************}
{*  Created by Andy Carlson                                       *}
{*  Input:  The User inputs a value for the year a person was     *}
{*          born                                                  *}
{*  Process: Array's Used to process birth years and age          *}
{*  Output: The Age of the person who's birth year was entered    *}
{******************************************************************}

uses WinCRT;

const
      ThisYear = 2000;
 
var
  Continue,                                {User Option to Continue}
  i : integer;                             {Index Value for Array Loops}
  BirthYear : Array [1..5] of integer;     {Array of Birth Years}
  Age : Array [1..5] of integer;           {Array of Ages calculated}

{** Main Logic **}
begin 
  {** Continue Loop **}
  Repeat 
    clrscr;

    {** Loop for BirthYear Initilization **}
    for i := 1 to 5 do
      begin
        write('Enter the Birth Year for Person ',i,' ');
        readln(BirthYear[i]);
      end; {Init Loop}

    writeln('*************** ********');
    writeln('*  Birth Year  *  Age   *');
    writeln(' ************** ********');
          
    {** Loop for Calculation of Age **}
    for i := 1 to 5 do
      begin
        Age[i] := ThisYear - BirthYear[i];
        writeln('* ', BirthYear[i]:12,' * ',Age[i]:6,' *');
      end; {Age Calc Loop}

    writeln(' ************** ********');
    writeln;
    writeln('Do You Want to Do It Again? (1 => Yes, 0 => No)');
    readln(Continue);
  until Continue = 0; {Repeat}
  writeln('Thank you for using my program.');
end.

 

