program sentence (input, output);

{****************************************}
{*   Created by Andy Carlson            *}
{*   Purpose:   Test user on            *}
{*              conjunctions used in a  *}
{*              given sentence          *}
{****************************************}

uses WinCRT;

const
     {** Types of Sentences **}
     CoordConj = 1;
     SuborConj = 2;
     ConjAdver = 3;
     {** Maximum Array Value **}
     max_ar_val=200;

type
    {** Record used to hold sentences **}
    sentence_record = record
                            Clause1:string[30];
                            Clause2:string[30];
                            Senttype:integer;
                            ArrayVal:integer;
                      end;
    {** Array Used to hold up to 200 problems **} 
    sentence_array = array[1..max_ar_val] of sentence_record;
    {** Array's that will hold the values of conjunctions **}
    CoordConj_array = array[1..7] of string[10];
    SubordConj_array = array[1..14] of string[15];
    ConjAdver_array = array[1..8] of string[20];

label start;

var
   sentences:sentence_array;                    {Variable for the array of sentences}               
   CoordConjunctions: CoordConj_array;           {Variable for the array of coordinating conjunctions}
   SubordConjunctions: SubordConj_array;        {Variable for the array of subordinating Conjunctions}
   ConjAdverbs: ConjAdver_array;                {Variable for the array of Conjunctive Adverbs}

procedure define_arrays;
begin
  {** Define the Array of Coordinating Conjunctions **}
  CoordConjunctions[1]:='for';
  CoordConjunctions[2]:='and';
  CoordConjunctions[3]:='nor';
  CoordConjunctions[4]:='but';
  CoordConjunctions[5]:='or';
  CoordConjunctions[6]:='yet';
  CoordConjunctions[7]:='so';

  {** Define the Array of Subordinating Conjunctions **}
  SubordConjunctions[1]:='after';
  SubordConjunctions[2]:='although';
  SubordConjunctions[3]:='as';
  SubordConjunctions[4]:='as if';
  SubordConjunctions[5]:='as though';
  SubordConjunctions[6]:='because';
  SubordConjunctions[7]:='before';
  SubordConjunctions[8]:='if';
  SubordConjunctions[9]:='since';
  SubordConjunctions[10]:='unless';
  SubordConjunctions[11]:='until';
  SubordConjunctions[12]:='when';
  SubordConjunctions[13]:='whenever';
  SubordConjunctions[14]:='while';

  {** Define the Array of Conjunctive Adverbs **}
  ConjAdverbs[1]:='consequently';
  ConjAdverbs[2]:='futhermore';
  ConjAdverbs[3]:='however';
  ConjAdverbs[4]:='instead';
  ConjAdverbs[5]:='meanwhile';
  ConjAdverbs[6]:='nevertheless';
  ConjAdverbs[7]:='otherwise';
  ConjAdverbs[8]:='therefore';

  {** Define Array of Sentences to use **}

end;

procedure menu_display;
begin
  {** This procedure prints out the menu as it will appear on the screen **}
  clrscr;
  writeln('             *******************************************');
  writeln('             *            Conjunctions Tester          *');
  writeln('             *******************************************');
  writeln('             *  A) Test on Conjunctions(Not Available) *');
  writeln('             *  B) List Coordinating Conjunctions      *');
  writeln('             *  C) List Subordinating Conjunctions     *');
  writeln('             *  D) List Conjunctive Adverbs            *');
  writeln('             *  E) Help                                *');
  writeln('             *******************************************');
end;   

procedure menu_options;
var
  option:char; {User Choice From Menu}
  ar_num:integer; {number of an array value -- used to print out array values **}
begin
  {** This procedure will take the users choice of actions and execute it **}
  menu_display;
  readln(option);
  if option='a' then
    writeln('This function is not available yet.')
  else if option='b' then
    begin
      {** Writes out all of the Coordinating Conjunctions **}
      writeln('* Coordinating Conjunctions *');
      writeln('');
      for ar_num:=1 to 7 do
        begin
          writeln(CoordConjunctions[ar_num]);
        end;
      readln;
    end
  else if option='c' then
    begin
      {** Writes out all of the Subordinating Conjunctions **}
      writeln('* Subordinating Conjunctions *');
      writeln('');
      for ar_num:=1 to 24 do
        begin
          writeln(SubordConjunctions[ar_num]);
        end;
      readln;
    end
  else if option='d' then
    begin
      {** Writes out all of the Conjunctive Adverbs **}
      writeln('* Conjunctive Adverbs *');
      writeln('');
      for ar_num:=1 to 8 do
        begin
          writeln(ConjAdverbs[ar_num]);
        end;
      readln;
    end
  else if option='e' then
    begin
      {** Writes out help for this program **}
      writeln('To use this program you must have caps lock off');
      writeln('Thank you for using this cheezy program');
      writeln('(c) 2000 My Sucky Programs');
      readln;
    end
  else
    writeln('Invalid Command');
    readln;
end;

   
{** Main Program **}
begin
  define_arrays;
  start: menu_options;
  goto start;

end.