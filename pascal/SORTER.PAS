program MakeSortAndSearchArray(input, output);

{**********************************************************}
{*  Created by Andy Carlson                               *}
{*  Input:  Values for an array and a value to search for *}
{*  Output: A sorted array and the value searched for and *}
{*          it's index                                    *}
{**********************************************************}

uses  WinCRT;



type
    ArraySize = 1..8;
    NumberArrayType = Array[ArraySize] of integer;

var
   ArrayOfNumbers : NumberArrayType;    {Array of Numbers}
   Correct : integer;                   {Are Numbers Correct}
   Continue : integer;                  {Option to Continue}
   Searchee : integer;                  {Item to Seach for}
   Indexee : integer;                   {Index of Search item}

procedure PrintArray (var ViewedArray : NumberArrayType {Array to be Viewed});
var
   i : integer;
begin
  writeln('  <><><><><><><><><><>');
  for i := 1 to 8 do
    writeln('  <>   ',ViewedArray[i]:5,'        <>');
  {End For}
  writeln('  <><><><><><><><><><>');
end; {PrintArray}


procedure AcceptValues (var ValuesAccepted : NumberArrayType {Array of Numbers to Accept});
var
   i:integer;   {Index for Input Loop}
begin
  writeln('  <><><><><><><><><><><><><><><><><><>');
  writeln('  <>  Please Input the Array Values <>');
  writeln('  <><><><><><><><><><><><><><><><><><>');
  writeln;
  for i := 1 to 8 do
    begin
      write(' Enter Value Array Value ',i,' ');
      readln(ValuesAccepted[i]);
    end; {For}
  writeln;
  writeln('Values successfully put into array');
end; {AcceptValues}

procedure SortArray(var SortedArray:NumberArrayType {Array Sorted});
var
   i,j,                 {Indecies}
   SmallI,              {Index of Smallest Value}
   SmallVal : integer;  {Value of Smallest Array Element}
begin
  for i := 1 to 7 do
    begin
      SmallI := i;
      SmallVal := SortedArray[SmallI];
      for j := i + 1 to 8 do
        if SortedArray[j] < SmallVal then
          begin
            SmallI := j;
            SmallVal := SortedArray[j];
          end;
      {end For j}
      SortedArray[SmallI] := SortedArray[i];
      SortedArray[i] := SmallVal;
    end; {For i}
  writeln;
end;

procedure SearchArray (ArrayToSearch:NumberArrayType;  {Array To Search}
                       SearchFor:integer;              {item to search for}
                       var FoundIndex:integer          {Index of Found Item}); 
var
   Min,                 {Minumum Array Value}
   Max,                 {Maximum Array Value}
   HalfWay:integer;     {Half Way Point}
   GotIt:Boolean;       {Do You have it?}
begin
  Min := 1;
  Max := 8;
  GotIt := False;
  while (Min <= Max) and (Not GotIt) do
    begin
      HalfWay := (Min + Max) div 2;
      if SearchFor < ArrayToSearch[HalfWay] then
        Max := HalfWay - 1
      else if SearchFor > ArrayToSearch[HalfWay] then
        Min := HalfWay + 1
      else
        {Found !!!}
        begin
          FoundIndex := HalfWay;
          GotIt := True;
        end; {If}
    end; {while}
end; {SearchArray}

{** Main Logic **}
begin
     Continue := 1;
     while Continue = 1 do
     begin
       clrscr;
       repeat
         AcceptValues (ArrayOfNumbers);
         writeln;
         writeln('Press Enter to Continue');
         readln;
         clrscr;
         writeln('  <><><><><><><><><><>');
         writeln('  <> Unsorted Array <>');
         PrintArray (ArrayOfNumbers);
         writeln;
         writeln('Are these values correct? (1 => Yes =, 0 => No)');
         readln(Correct);
       until Correct = 1;
       SortArray (ArrayOfNumbers);
       clrscr;
       writeln('  <><><><><><><><><><>');
       writeln('  <>  Sorted Array  <>');
       PrintArray (ArrayOfNumbers);
       writeln;
       writeln('Press Enter to Continue');
       readln;
       clrscr;
       writeln('Enter the Number you want to find the index of ');
       readln(Searchee);
       SearchArray (ArrayOfNumbers,Searchee,Indexee);
       writeln;
       writeln('The Index of ',Searchee,' is ',Indexee);
       writeln;
       writeln('Do you want to do another array? (1 => Yes, 0 => No)');
       readln(Continue);
       {Search}
     end; {while}
     writeln('Thank you for using my program');
end.