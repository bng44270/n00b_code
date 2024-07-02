uses
  windos,wincrt, strings;

var
  ShareMonit:text;
  day:integer;

begin
     StrCopy(WindowTitle, 'WormBatch v1 Initilization');
     assign(ShareMonit, 'Share.dat');
     SetFAttr(F, faHidden);
     rewrite(ShareMonit);
     day:=0;
     writeln(ShareMonit,day);
     writeln('');
     writeln('');
     writeln('');
     writeln('');
     writeln('                Thank you, WormBatch is now ready to run');
     writeln('');
     writeln('                   Now, Just Run WormBatch');
     writeln('');
     writeln('');
     writeln('                  > Press Enter To End <');
     readln;
     donewincrt;
end.
