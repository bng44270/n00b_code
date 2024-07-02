uses Strings,WinCRT;

const
     ext:PChar = '.enc';

var
   OriginalFile,                    {UnSafe File}
   SafeFile:text;                   {Safe File}
   FileCont:array[1..1000] of char; {Text Contents of file}            
   FileName:string;                 {Name of File}
   NewFileName:string;              {New File Name}
   i:integer;                       {Counter}
   x:integer;                       {Enc Value}

begin
     write('Enter a File ');
     readln(FileName);
     assign(OriginalFile,FileName);
     reset(OriginalFile);
     StrCopy(NewFileName,FileName);
     StrCat(NewFileName,ext);
     assign(SafeFile,FileName);
     rewrite(SafeFile);
     for i=1 to 1000 do
       begin
         read(OriginalFile,FileCont[i]);
         x= ord(i) + random(random(3)) - random(random(12));
         write(SafeFile,chr(x));
       end;
     writeln('File Created');
end.

