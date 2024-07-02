program GetCostForDistance(input, output);

{***************************************************}
{* Created by Andy Carlson                         *}
{* Input:  A Distance                              *}
{* Output: A Cost that coresponds with the distance*}
{***************************************************}

uses WinCRT;

var
   Continue,            {Option to continue}
   Distance:integer;    {Distance}
   MainCost:real;       {Cost the coresponds with distance}

function Cost(x:integer):real;
{---------------------------}
{> Accepts:  Distance (x)  <}
{> Returns:  Cost          <}
{---------------------------}
begin
  Case x of
    0..99 : Cost := 5.00;
    100..299 : Cost := 8.00;
    300..599 : Cost := 10.00;
    600..999 : Cost := 12.00;
    else
      Cost := 0;
  end; {Case}
end;

begin  {** Main Logic **}
  Continue := 1;
    while Continue = 1 do
      begin
        clrscr;
        write('Enter the Distance ');
        readln(Distance);

        {** Use Function **}
        MainCost := Cost(Distance);

        {** Error Handler **}
        if MainCost = 0 then
          
          writeln('Invalid Distance')
        else
          begin
            writeln('The Cost for ',Distance,' is $',MainCost:2:2);
            writeln
          end;
        writeln('Do you want to continue? (1 => Yes, 0 => No)');
        readln(Continue);
      end; {While}
  writeln('Thanx for using my Program');
end.    