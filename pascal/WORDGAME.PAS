{*
Letter_Game.pas

You Must have letters.txt in the directory with this program.

*}

uses Strings,WinCRT;

type
    LetterInfo = record
                       Lower: array[1..26] of char;
                       Upper: array[1..26] of char;
                       Number:array[1..26] of integer;
                 end;
    WordStringType = array[1..20] of char;

var
   LetterFile:text;                    {File With Letters and Numeric Values}
   LetterRecord:LetterInfo;            {Record that will hold the info from file}
   WordValue:WordStringType;           {Word to play with}
   i:integer;
   j:integer;
   x:integer;
   max:integer;

   total:integer;
begin
     {** Reads File **}
     assign(LetterFile,'Letters.txt');
     reset(LetterFile);
     for x := 1 to 26 do
       readln(LetterFile,LetterRecord.Upper[x],LetterRecord.Lower[x],LetterRecord.Number[x]);
     write('Enter the length of your word (max of 20) ');
     readln(max);     
     for i := 1 to max do
     begin
       write('Enter letter #',i,' ');
       WordValue[i] := upcase(readkey);
     end; 
     Total := 0;
     for i := 1 to max do
       begin
         for j:= 1 to 26 do
           begin
             if WordValue[i]=LetterRecord.Upper[j] then
               begin
                 Total := Total + LetterRecord.Number[j];
               end;
           end;
       end;
     writeln('Your Word has a value of ',Total);
end.            
            
                       
                 
