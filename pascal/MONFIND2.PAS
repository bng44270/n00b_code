program GetMonth (input, output);

{**************************************************}
{*  Created by Andy Carlson                       *}
{*                                                *}                          
{*  Inputs:  A number that identifies a month     *}
{*  Outputs: A menu for months and a month given  *}
{*           a number that indentifies it.        *}
{**************************************************}

uses WinCRT;

{Global Variables}
var
   Continue,                 {Option to Continue}
   GlobeMonthVal:integer;    {Number Value for Month}

procedure MenuDisplay(var MonthNum:integer {Month Number Passed to Main});              

{------------------------------------}
{> Output:  Option menu for months  <}
{> Input:   A months number that is <}
{>          passed to the main      <}
{------------------------------------}

begin
  writeln('             ***************************');
  writeln('             *                         *');
  writeln('             *      Monthly Menu       *');
  writeln('             *                         *');
  writeln('             ***************************');
  writeln('             *                         *');
  writeln('             *       1) January        *');
  writeln('             *       2) February       *');
  writeln('             *       3) March          *');
  writeln('             *       4) April          *');
  writeln('             *       5) May            *');
  writeln('             *       6) June           *');
  writeln('             *       7) July           *');
  writeln('             *       8) August         *');
  writeln('             *       9) September      *');
  writeln('             *       10) October       *');
  writeln('             *       11) November      *');
  writeln('             *       12) December      *');
  writeln('             *                         *');
  writeln('             ***************************');

  writeln;
  
  write('>');
  {** Ask for input **}
  readln(MonthNum);
  writeln;
end; {MenuDisplay}


procedure GetMonthValue(Month:integer {Month value passed from Main});

{-----------------------------------------}
{> Throws: Month from input in Main      <}
{>         Logic                         <}                                                    
{> Output: Month that corsiponds with    <}
{>         the Number                    <}
{-----------------------------------------}

begin
  {** Condition for Months **}
  if Month = 1 then
    writeln('The Month is January')
  else
  if Month = 2 then
    writeln('The Month is February')
  else
  if Month = 3 then
    writeln('The Month is March')
  else
  if Month = 4 then
    writeln('The Month is April')
  else
  if Month = 5 then
    writeln('The Month is May')
  else
  if Month = 6 then
    writeln('The Month is June')
  else
  if Month = 7 then
      writeln('The Month is July')
  else
  if Month = 8 then
    writeln('The Month is August')
  else
  if Month = 9 then
    writeln('The Month is September')
  else
  if Month = 10 then
    writeln('The Month is October')
  else
  if Month = 11 then
    writeln('The Month is November')
  else
  if Month = 12 then
    writeln('The Month is December')
  else
    {** Error **}
    writeln('Remember, there are 12 Months in a year. DUH!!!!');

  {** End If **}
end; {GetMonthValue}

{** Main Logic **}
begin
     Continue := 1;
       while Continue = 1 do
         begin
           clrscr;

           {** Display Menu **}
           MenuDisplay(GlobeMonthVal);
                
           {** Use GetMonthValue **}
           GetMonthValue( GlobeMonthVal ); 
           writeln('Do you want to get the month again? (1 => Yes, 0 => No)');
           readln( Continue );
         end; {while}
     writeln('Program Done');
end.            