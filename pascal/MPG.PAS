program CalculateMilesPerGallon(input, output);

{********************************************************}
{*  Created by Andy Carlson                             *}
{*  Updated by Andy Carlson on 9/18/00 to add a         *}
{*                            conditional statement     *}
{*                                                      *}
{*  Inputs:     StartMiles, EndMiles, and GallonsUsed   *}
{*  Calculates: MilesTraveled, use that to calc. Miles  *}
{*              MilesPerGallon                          *}
{*  Outputs:    MilesPerGallon and a Statement          *}
{*              Confirming Good or Bad Mileage          *}
{********************************************************}

USES WinCRT;

var
 StartMiles,              {Miles on Odometer at the start of trip}
 EndMiles,                {Miles on Odometer at the end of trip}
 MilesTraveled,           {Total Miles Traveled on Trip (EndMiles - StartMiles) }
 GallonsUsed:integer;     {Gallons of Gas Used on the Trip}
 MilesPerGallon:real;     {Mileage made on trip}

begin
  {** Inputs **}
  write('Enter the Odometer Reading at the beginning of your trip ');
  readln(StartMiles);

  write('Enter the Odometer Reading at the end of your trip ');
  readln(EndMiles);

  write('Enter the Gallons of Gas you used ');
  readln(GallonsUsed);

  {** Calculations **}
  MilesTraveled := EndMiles - StartMiles;
  MilesPerGallon := MilesTraveled / GallonsUsed;

  {** Output **}
  writeln('');
  writeln('You got ',MilesPerGallon:4:1,' Miles Per Gallon');

  {** Conditional **}
  if MilesPerGallon < 20 then
    writeln('Man, is your car a GAS HOG')
  else
    writeln('Good Mileage');
end.