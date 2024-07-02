program GetYourGrade (input, output);

{************************************************}
{*  Created by Andy Carlson                     *}
{*  Purpose:   Get the grade level of the user  *}
{*  Inputs:    1, 2, 3, 4, or 5 (stands for     *}
{*             grade level)                     *}
{*  Output:    Grade level                      *}
{************************************************}

USES WinCRT;

CONST
     {** Constants that stand for Grade Levels **}
     Freshmen=1;
     Sophomore=2;
     Junior=3;
     Senior=4;
     Graduate=5;

VAR
   grade:integer;  {The Grade that user enters}

begin
  writeln('To Use This Program, Enter:');
  writeln('   1 - Freshmen');
  writeln('   2 - Sophomore');
  writeln('   3 - Junior');
  writeln('   4 - Senior');
  writeln('   5 - Graduated');
  writeln('');  

  {** Inputs **}
  write('Enter the grade that you are in: ');
  readln(grade);

  {** Conditional Output **}
  if grade = Freshmen then
    {** Output if they are a freshmen **}
    writeln('You are a Freshmen')
  else if grade = Sophomore then
    {** Output if they are a sophomore **}
    writeln('You are a Sophomore')
  else if grade = Junior then
    {** Output if they are a junior **}
    writeln('You are a Junior')
  else if grade = Senior then
    {** Output if they are a Senior **}
    writeln('You are a Senior')
  else if grade = Graduate then
    {** Output if they are Graduated **}
    writeln('You have Graduated')
  else
    {** Output if a value is entered that isn't 1, 2, 3, 4, or 5 **}
    writeln('Invalid Number Entry');

  {** End If **}

  {** Output Every Time **}
  writeln('Thank you for using my program');
end.  