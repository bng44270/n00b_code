       IDENTIFICATION DIVISION.
       PROGRAM-ID.  debug-prog-3.
       AUTHOR. Author Here.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Print-File           assign to disk.

       DATA DIVISION.
       FILE SECTION.
       FD  Print-File.
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
       1000-MAINLINE-LOGIC.
           DISPLAY 'Enter your FIRST name '.
           ACCEPT first-name.
           DISPLAY 'Enter your LAST name'.
           ACCEPT last-name.
           DISPLAY 'What is your age?'.
           ACCEPT age.

           OPEN output print-file.
           MOVE first-name to first-name-pa.
           MOVE last-name to last-name-pa.
           MOVE age to age-pa.
           MOVE print-area to print-record.
           WRITE print-record.
           CLOSE print-file.
           STOP RUN.
