(*
WormRun.pas

Created a custom batch file that is used to execute the WORM Mac emulator
with the desired parameters (ROM Image file and Disk Image file).

(c)  Nerdware 2001

*)

uses WinCRT,strings;

var
   OutFile:text;                {Batch File Output}
   RomFileName,                 {Name of ROM Image File}
   DiskFileName:string[15];     {Name of Disk Image File}

{** Main Logic **}
begin
     StrCopy(WindowTitle, 'WormBatch v1');
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
end.                          