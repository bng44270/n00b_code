       IDENTIFICATION DIVISION.
       PROGRAM-ID.  ForFun1.
       AUTHOR.  Andy Carlson.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ORIGINAL-FILE ASSIGN TO "u:\cobol\PRG08.DAT"
                                   ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-PRINTER-FILE ASSIGN TO PRINTER "CON:".
           select data-file assign to "c:\windows\desktop\new.scr".


       DATA DIVISION.
       FILE SECTION.
       fd data-file.
       01 data-record               pic x(100).

       FD ORIGINAL-FILE.
       01 ORIGINAL-RECORD.
           03 STORE-NUMBER          PIC X(2).
           03 DEPARTMENT-NUMBER     PIC X(2).
           03 PRODUCT-CODE          PIC X(10).
           03 DESCRIPTION           PIC X(20).
           03 UNIT-COST             PIC 99999V99.
           03 QUANTITY              PIC 9(6).
           03 RETAIL-PRICE          PIC 99999V99.

       FD OUTPUT-PRINTER-FILE.
       01 OUTPUT-PRINTER-RECORD        PIC X(100).

       working-storage section.
       01 General-Usage.
           03 eof-flag                 pic x(3) value spaces.
               88 end-of-file          value "YES".
           03 table-index              pic 9(3) value 1.
           03 report-index             pic z99.
           03 view-index               pic 9(3).
           03 do-again                 pic x(3) value space.
               88 Stop-Loop            value "NO".
           03 loop-counter             pic 999 value 1.

       01 Printer-Record.
           03 printer-data pic x(70) occurs 20 times.


      *ASK HOW TO USE 01, 03 ... HIERARCHY


       01 Main-Info-Table.
           03 Main-Table-Data occurs 250 times.
               05 table-count           pic zz9.
               05                       pic x(2) value spaces.
               05 DESCRIPTION           PIC X(20).
               05                       pic x(5) value space.
               05 product-code          pic x(10).
               05                       pic x(3) value space.
               05 UNIT-COST             PIC $$$$9.99.
               05                       pic x(5) value space.
               05 QUANTITY              PIC z(5)9.


       01 HEADING-LINE.
           03                          PIC X(11) VALUE "DESCRIPTION".
           03                          PIC X(14) VALUE SPACES.
           03                          PIC X(10) VALUE "PROD. CODE".
           03                          PIC X(5) VALUE SPACES.
           03                          PIC X(9) VALUE "UNIT COST".
           03                          PIC X(4) VALUE SPACES.
           03                          PIC X(8) VALUE "QUANTITY".




       procedure division.
       1000-Main-Logic.
         open input original-file
         perform until end-of-file
           read original-file
             at end
               move "YES" to eof-flag
             not at end
               move corresponding original-record
                   to main-table-data (table-index)
               move table-index to table-count (table-index)
               compute table-index = table-index + 1
           end-read
         end-perform
         close original-file

         open output data-file
         write data-record from heading-line after advancing page
         perform varying loop-counter from 1 by 1
                       until loop-counter = table-index
           write data-record from main-table-data (loop-counter)
                           after advancing 1 line
         end-perform
         close data-file



         perform until Stop-Loop
           move table-index to report-index
           display "There are " report-index " records available."
           display "Enter the record to view"
           accept view-index
           open output output-printer-file
           write output-printer-record from HEADING-LINE after
                         advancing 2 line

           write output-printer-record from Main-Table-Data (view-index)
                       after advancing 1 line
           close output-printer-file
           display spaces
           display spaces
           display "Do You Wish to Search Again? (Y/N)"
           accept do-again
           if do-again = 'N' or do-again = 'n'
             move 'NO' to do-again
           end-if
         end-perform
         stop run.
