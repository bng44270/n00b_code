program RinkyDooflingyDeclineFinder(input, output);

{***********************************************************************}
{*  Created by Andy Carlson                                            *}
{*  Purpose:   To Find, using the net income, advertising expences,    *}
{*             and number of sales made, the level at which the        *}
{*             the net profit declines                                 *}
{*  Calculate: An increase in the companies sales by 20 % every time   *}
{*             the advertising expences doubles                        *}
{*  Output:    The advertising expences where the sales begins to      *}
{*             decrease.                                               *}
{***********************************************************************}

USES WinCRT;

const
     OpCost = 1000.00;       {Operating Cost}
     DooflingCost = 300.00;  {Cost of Individual Duflingy}
var
   AdverCost,               {Advertising Expences}
   DooflingTotalCost,       {Total Dollar Sales of Dooflingy's}
   DooflingSales,           {Number of Dooflingy's Sold}
   DooflingNetProfit:real;  {Net Cost of Dooflingy's Sold}
   Continue:integer;        {Option to Continue 1 is yes, 0 is no}   


begin
     {** Declare the Starting Value for the Advertising and NetCost **}
     Continue := 1;
     while Continue = 1 do
       AdverCost := 2000.00;
       DooflingSales := 200;
       DooflingTotalCost := DooflingSales * DooflingCost;
       DooflingNetProfit := DooflingTotalCost - (AdverCost + OpCost);
       writeln('Net Profit is $',DooflingNetProfit:5:2);
       readln;
       begin
         while DooflingNetProfit > -1 do
           begin
             {** Print out Starting Values **}
             clrscr;
             writeln('    **************************************************');
             writeln('    *        Dooflingy Output Values                 *');
             writeln('    **************************************************');
             writeln('The Total No. of Dooflingy''s Sold is ........... ',DooflingSales:7:0);
             writeln('The Total Dollar Sales of Dooflingy''s is .......$',DooflingTotalCost:5:2);
             writeln('The Total Advertising Cost is ...................$',AdverCost:5:2);
             writeln('The Net Profit from Duflingy''s .................$',DooflingNetProfit:5:2);
             writeln;
             writeln('Press Enter to View Next Values');
             readln;

             AdverCost := AdverCost * 2;
             DooflingSales := DooflingSales * 1.2;
             DooflingTotalCost := DooflingSales * DooflingCost;
             DooflingNetProfit := DooflingTotalCost - (AdverCost + OpCost);
           end;
         writeln('Do you want to Calculate Values Again? (1 => Yes; 0 => No)');
         readln(Continue);
       end;
     writeln('Program Done');
     writeln;
     writeln('The Net Profit Before it begins to decline is $',DooflingNetProfit:5:2);
     writeln(' :-)  Thank You for using my program');
end. 
