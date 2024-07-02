       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PRG1.
       AUTHOR. Andy Carlson.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRINT-FILE       ASSIGN TO DISK.

       DATA DIVISION.
       FILE SECTION.
       FD  PRINT-FILE.
       01  PRINT-RECORD            PIC X(80).

       WORKING-STORAGE SECTION.

       01  INPUT-AREA.
           05 FIRST-NAME           PIC X(25).
           05 LAST-NAME            PIC X(25).
           05 AGE                  PIC X(02).

       01  PRINT-AREA.
           05 FIRST-NAME-PA        PIC X(25).
           05 LAST-NAME-PA         PIC X(25).
           05 AGE-PA               PIC X(02).

       PROCEDURE DIVISION.
           DISPLAY 'Enter Your First Name'.
           ACCEPT FIRST-NAME.
           DISPLAY 'Enter Your Last Name'.
           ACCEPT LAST-NAME.
           DISPLAY 'Enter Your Age'.
           ACCEPT AGE

           OPEN OUTPUT PRINT-FILE.
           MOVE FIRST-NAME TO FIRST-NAME-PA.
           MOVE LAST-NAME TO LAST-NAME-PA.
           MOVE AGE TO AGE-PA
           MOVE PRINT-AREA TO PRINT-RECORD.
           WRITE PRINT-RECORD.
           CLOSE PRINT-FILE.
           STOP RUN.
