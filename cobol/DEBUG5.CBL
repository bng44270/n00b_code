       ID DIVISION.
       PROGRAM-ID.  debug-prog-5.
       AUTHOR. Author Here.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Print-File           assign to disk.
       DATA DIVISION.
       FILE SECTION.
       FD  Print-File
           Data record is Print-Record.
       01  Print-Record                pic x(80).

       WORKING-STORAGE SECTION.
       01  Input-area.
           05  first-name              pic x(25).
           05  last-name               pic x(25).
           05  age                     pic x(02).

       01  Print-area.
           05  First-name-pa           pic x(25).
           05  Last-name-pa            pic x(25).
           05  age-pa                  pic x(02).

       PROCEDURE DIVISION.
       1000-INITIALIZE.
           PERFORM get-input
           OPEN output print-file
           PERFORM make-output
           CLOSE print-file
           STOP RUN.

       get-input.
           DISPLAY 'Enter your FIRST name '.
           ACCEPT first-name.
           DISPLAY 'Enter your LAST name'.
           ACCEPT last-name.
           DISPLAY 'What is your age?'.
           ACCEPT age.

       make-output.
           MOVE first-name to first-name-pa
           MOVE last-name to last-name-pa
           MOVE age to age-pa.
           WRITE print-record  from print-area.
      ****************************************************************

