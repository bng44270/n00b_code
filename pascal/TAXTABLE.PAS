program TaxTable(input, output);

{*******************************************************}
{*  Created by Andy Carlson                            *}
{*  Input:  An option to view a pre-made tax table or  *}
{*          to input values for the table              *}
{*  Output: A tax table                                *}
{*******************************************************}

uses WinCRT;

var

  Continue,             {Option to Continue}
  TaxTableOpt:integer;  {If it is 1, it will print out the standard
                         0.25 - 3.00 table.  If it is 2 then it will
                         print out a custom table}

procedure DisplayInstructions;
  {---------------------------------------}
  {> Output:  Instructions for use       <}
  {---------------------------------------}
  begin
    writeln('    To use this program, you can either use "1" to view a tax');
    writeln('table that is created by pre-defined values of $0.25 - $3.00');
    writeln('or you can use "2" to create a custom tax table.');
  end;{DisplayInstructions}


procedure TaxTableMaker (TaxTableType:integer);
  {---------------------------------------}
  {> Accepts:  An option of what table to<}
  {>           print out.                <}
  {> Inputs:   If Custom table, the range<}
  {>           of values and incriment.  <}
  {>           If normal table, none.    <}
  {> Output:   A standard or custom table<}
  {---------------------------------------}
  var                                      
      HighVal,            {Highest value to calculate tax for}
      LowVal,             {Lowest value to calculate tax for}
      LowValTax,          {Tax due with LowVal}
      Incriment:real;     {Incriment to increase money due by}

  function TaxDue (TotDue:real {Total Money Due}):real;
  {---------------------------------------}
  {>  Accepts:  Value of total $$ due    <}
  {>  Returns:  Tax due based on 6.25%   <}
  {---------------------------------------}
    begin
      TaxDue := TotDue * 0.0625;
    end; {TaxDue}


     
  begin
      if TaxTableType = 1 then
        begin
        {** Print out $0.25 - $3.00 table **}
        clrscr;
        writeln(' Money Due        Tax Due');
        writeln(' =========        =======');
        HighVal := 3.00;
        LowVal := 0.25;
        Incriment := 0.25;
          while LowVal <= HighVal do
            begin
              LowValTax := TaxDue ( LowVal );
              writeln('  ',LowVal:4:2,'              ',LowValTax:3:2);
              LowVal := LowVal + Incriment;
            end; {LowVal HighVal}
        writeln;
        writeln('Here is your pre-made tax table');
      end {TableType=1}
    else
    if TaxTableType = 2 then
      begin
        {** Print out a Tax table with user defined values **}
        write('Enter the lowest value you want to calculate >');
        readln( LowVal );
        write('Enter the highest value you want to calculate >');
        readln( HighVal );
        writeln('Enter the rate at which you want the values');
        write('to increase >');
        readln( Incriment );
        clrscr;
        writeln(' Money Due        Tax Due');
        writeln(' =========        =======');
          while LowVal <= HighVal do
            begin
              LowValTax := TaxDue ( LowVal );
              writeln('  ',LowVal:4:2,'             ',LowValTax:3:2);
              LowVal := LowVal + Incriment;
            end; {LowVal HighVal}
        writeln;
        writeln('Here is the tax table you wanted');
      end {Tabletype=2}
    else
      writeln('Invalid Table Type');
  end; {TaxTableMaker}


{** Main Logic **}
begin
  Continue := 1;
    while Continue = 1 do
      begin
        clrscr;
        DisplayInstructions;
        writeln;
        write('Enter the Table Type that you want to make >');
        readln( TaxTableOpt );
        TaxTableMaker( TaxTableOpt );
        writeln;
        writeln('Do you want to make another table? (1 => Yes; 0 => No)');
        readln( Continue );
      end; { Continue }
  writeln(' :-) Thanx for using my program');
end.

                                                  