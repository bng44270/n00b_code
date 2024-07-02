(*
WormRun.pas

Created a custom batch file that is used to execute the WORM Mac emulator
with the desired parameters (ROM Image file and Disk Image file).

(c)  Nerdware 2001

*)

uses WinDos,WinCRT,strings;

var
   OutFile:text;                {Batch File Output}
   ShareMonit:text;             {File for Shareware}
   RomFileName,                 {Name of ROM Image File}
   DiskFileName:string[15];     {Name of Disk Image File}
   NumUses:integer;             {Number of Uses}


{** Main Logic **}
begin
     assign(ShareMonit,'Share.dat');
     reset(ShareMonit);
     readln(ShareMonit, NumUses);
     if NumUses <= 30 then
       begin
         NumUses := NumUses + 1;
         rewrite(ShareMonit);
         writeln(ShareMonit, NumUses);
         StrCopy(WindowTitle, 'WormBatch v1 (Trial)');
         writeln('');
         writeln('');
         writeln('');
         writeln('');
         writeln('');
         writeln('This is trial software. (30 Uses)  To retain full use of');
         writeln('it, please e-mail wormbatch@yahoo.com.  Through this');
         writeln('mail, you can request a fully usable copy of  WormBatch v1.');
         writeln('The fee is $3 (American).');
         writeln('');
         writeln('');
         writeln('');
         writeln('               > Press Enter to Continue <');
         readln;
         clrscr;
         writeln('            *******************************');
         writeln('            *          WormBatch v1       *');
         writeln('            *******************************');
         writeln('            This program will help you:');
         writeln('                   1) Run Your WORM (R) Emulator');
         writeln('                   2) Change WORM (R) startup options');
         writeln('                   3) Avoid DOS interaction');
         writeln('');
         writeln('');
         writeln('               > Press Enter to Continue <');
         readln;
         clrscr;
         assign(OutFile,'Worm_Run.bat');
         rewrite(OutFile);
         writeln('Enter The DOS (short) name of your');
         write  ('ROM Image File. ');
         readln(RomFileName);
         writeln('');
         writeln('Enter the DOS (short) name of your');
         write  ('Disk Image File. ');
         readln(DiskFileName);
         writeln(OutFile, 'worm ',RomFileName, ' ',DiskFileName);
         close(OutFile);
         writeln('');
         writeln('Your Batch File is Created');
         writeln('');
         writeln('               > Press Enter to Continue <');
         readln;
         clrscr;
         writeln('Thank you for using WormBatch');
         writeln('');
         writeln('To Run WORM (R) with your specified startup options,');
         writeln('locate the Worm_Run.bat file.  Simply run this file.');
         writeln('');
         writeln('Thank you and God Bless!');
         writeln('');
         writeln('(c) Nerdware 2001');
         writeln('');
         writeln('               > Press Enter to End <');
         readln;
         donewincrt;
       end
     else
       begin
         StrCopy(WindowTitle, 'WormBatch v1 (Trial OVER)');
         writeln('Sorry, your trial is over.  Please e-mail wormbatch@yahoo.com');
         writeln('for your continuing use of this program.
         writeln('');
         writeln('PEACE and God Bless!!');
         writeln('');
         writeln('               > Press Enter to End <');
         readln;
         donewincrt;
       end;
end.                          