uses WinCRT;
var
   UserFileMain:text;      {Name of file that user wants to input info to or}
                           {output to screen}
   ErrorLevel:integer;     {Error returned}
   UserFileName:string;    {Name and path of user file}
   Continue:integer;       {Option to Continue}


function NumOfLines(var UserFile:text  {File to Find # of lines in}):integer;
  var
     LineData:string;
     Temp:integer;
  begin
    Temp := 0;
    while not eof(UserFile) do
      begin
        readln(UserFile,LineData);
        Temp := Temp + 1;
      end;
    NumOfLines := Temp;
  end;

{** Main Logic **}
begin
  Continue := 1;
  while Continue = 1 do
    begin
      clrscr;
      writeln('Enter a file name');
      readln(UserFileName);
      assign(UserFileMain,UserFileName);
      reset(UserFileMain);
      writeln('There are ',NumOfLines(UserFileMain),' lines in ',UserFileName);
      writeln;
      writeln('Do it again? (1 => Yes, 0 => No)');
      readln(Continue);
    end;
  writeln('Thanx for using my program');
end.





   