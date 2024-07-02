       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PRG7.
       AUTHOR.  Andy Carlson.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ORIGINAL-FILE ASSIGN TO "PRG07.DAT"
                                   ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-PRINTER-FILE ASSIGN TO PRINTER "LPT1:".

       DATA DIVISION.
       FILE SECTION.
       FD ORIGINAL-FILE.
       01 ORIGINAL-RECORD.
           03 STORE-NUMBER-OR          PIC X(2).
           03 DEPARTMENT-NUMBER-OR     PIC X(2).
           03 PRODUCT-CODE-OR          PIC X(10).
           03 DESCRIPTION-OR           PIC X(20).
           03 UNIT-COST-OR             PIC 99999V99.
           03 QUANTITY-OR              PIC 999999.
           03 RETAIL-COST-OR           PIC 99999V99.

       FD OUTPUT-PRINTER-FILE.
       01 OUTPUT-PRINTER-RECORD        PIC X(100).

       WORKING-STORAGE SECTION.

       01 DETAIL-INFORMATION.
           03 Store-Number-pr          pic xx.
           03                          pic x value spaces.
           03 Department-Number        pic xx.
           03                          pic x value spaces.
           03 DESCRIPTION-PR           PIC X(20).
           03                          PIC X(1) VALUE SPACES.
           03 PRODUCT-CODE-PR          PIC X(10).
           03                          PIC X(1) VALUE SPACES.
           03 UNIT-COST-PR             PIC $$,$$9.99.
           03                          PIC X(1) VALUE SPACES.
           03 QUANTITY-PR              PIC ZZZ,ZZ9.
           03                          PIC X(1) VALUE SPACES.
           03 TOTAL-COST-PR            PIC $$,$$$,$$9.99.

       01 MISC-AND-COUNTER-LIST.
      *    Product Counter
           03 PRODUCT-COUNTER          PIC 9(2) VALUE ZEROS.
      *    Inventory Counter
           03 INVENTORY-ACCUMULATOR    PIC 9(6) VALUE ZEROS.
      *    End of File Flag
           03 EOF-MARKER               PIC X(3) VALUE "NO".
               88 END-OF-FILE          VALUE "YES".
      *    Grand Total For Whole Report
           03 GRAND-TOTAL              PIC 9(9)V99 VALUE ZEROS.
      *    Total Cost for each item
           03 TOTAL-COST               PIC 9(8)V99 VALUE ZEROS.
      *    Average cost per item of inventory
           03 AVG-COST-OF-ITEM         PIC 9(4)V99 VALUE ZEROS.
      *    Average cost per product
           03 AVG-COST-OF-PRODUCT      PIC 9(4)V99 VALUE ZEROS.
      *    Line Counter
           03 Line-Report-Counter      pic 99 value zeros.
      *    Page Counter
           03 Page-Report-Counter      pic 999 value zero.

       01 Date-Accept-Record.
           03 yy-dar                   pic 99.
           03 mm-dar                   pic 99.
           03 dd-dar                   pic 99.

       01 Date-Report-Record.
           03 mm-drr                   pic z9.
           03                          pic x value "/".
           03 dd-drr                   pic z9.
           03                          pic x value "/".
           03                          pic 99 value 20.
           03 yy-drr                   pic 99.

       01 Time-Accept-Record.
           03 hh-tar                   pic 99.
           03 mm-tar                   pic 99.
           03 ss-tar                   pic 99.
           03 ff-tar                   pic 99.

       01 Time-Report-Record.
           03 hh-trr                   pic 99.
           03                          pic x value ":".
           03 mm-trr                   pic 99.
           03                          pic x value ":".
           03 ss-trr                   pic 99.

       01 Page-Heading-Line.
           03 Date-Formatted           pic x(8).
           03                          pic x(3) value spaces.
           03                          pic x(28)
                       value "car3872's Business Report".
           03 Time-Formatted           pic x(8).
           03                          pic x(3) value spaces.
           03                          pic x(5) value "Page".
           03 Page-Number              pic zz9.

       01 HEADING-LINE.
           03                          pic x(6) value spaces.
           03                          PIC X(11) VALUE "DESCRIPTION".
           03                          PIC X(10) VALUE SPACES.
           03                          PIC X(10) VALUE "PROD. CODE".
           03                          PIC X(2) VALUE SPACES.
           03                          PIC X(9) VALUE "UNIT COST".
           03                          PIC X VALUE SPACES.
           03                          PIC X(8) VALUE "QUANTITY".
           03                          PIC X(4) VALUE SPACES.
           03                          PIC X(8) VALUE "TOT COST".

       01 PRODUCT-CONCLUSION-LINE.
           03                          PIC X(8) VALUE "PRODUCTS".
           03                          PIC X(3) VALUE SPACES.
           03 PRODUCTS-CL              PIC Z9.

       01 INVENTORY-CONCLUSION-LINE.
           03                          PIC X(9) VALUE "INVENTORY".
           03                          PIC X(6) VALUE SPACES.
           03 INVENTORY-CL             PIC ZZZ,ZZ9.

       01 TOTAL-COST-CONCLUSION-LINE.
           03                          PIC X(11) VALUE "GRAND TOTAL".
           03                          PIC X(9) VALUE SPACES.
           03 GRAND-TOTAL-CL           PIC $$,$$$,$$9.99.

       01 AVERAGE-TOP-LINE.
           03                          PIC X(14) VALUE "** AVERAGES **".

       01 AVG-COST-ITEM-CONCLUSION-LINE.
           03                          PIC X(16) VALUE "COST OF ITEM".
           03                          PIC X(12) VALUE SPACES.
           03 AVG-COST-OF-ITEM-CL      PIC $$,$$9.99.

       01 AVG-COST-PROD-CONCLUSION-LINE.
           03                          PIC X(17) VALUE "COST OF PROD ".
           03                          PIC X(15) VALUE SPACES.
           03 AVG-COST-OF-PROD-CL      PIC $$,$$9.99.


       PROCEDURE DIVISION.

       1000-MAIN-LOGIC.
           accept Time-Accept-Record from Time
           move hh-tar to hh-trr
           move mm-tar to mm-trr
           move ss-tar to ss-trr
           accept Date-Accept-Record from Date
           move mm-dar to mm-drr
           move dd-dar to dd-drr
           move yy-dar to yy-drr
           initialize Line-Report-Counter Page-Report-Counter
           OPEN INPUT ORIGINAL-FILE
           OPEN OUTPUT OUTPUT-PRINTER-FILE
           move 1 to Page-Report-Counter
           perform 2500-Write-Page-Heading
           PERFORM 3000-WRITE-HEADING
           PERFORM 2000-READ-ORIGINAL-FILE
               UNTIL END-OF-FILE
           PERFORM 5000-WRITE-CONCLUSION
           CLOSE ORIGINAL-FILE
           CLOSE OUTPUT-PRINTER-FILE
           STOP RUN.

       2000-READ-ORIGINAL-FILE.
           READ ORIGINAL-FILE
               AT END MOVE "YES" TO EOF-MARKER
               NOT AT END
                  if Line-Report-Counter > 55
                    add 1 to Page-Report-Counter
                    perform 2500-Write-Page-Heading
                    perform 3000-WRITE-HEADING
                    initialize Line-Report-Counter
                  end-if
                  add 1 to Line-Report-Counter
                  ADD 1 TO  PRODUCT-COUNTER
                  ADD QUANTITY-OR TO INVENTORY-ACCUMULATOR
                  COMPUTE TOTAL-COST = QUANTITY-OR * UNIT-COST-OR
                  ADD TOTAL-COST TO GRAND-TOTAL
                  MOVE DESCRIPTION-OR TO DESCRIPTION-PR
                  MOVE PRODUCT-CODE-OR TO PRODUCT-CODE-PR
                  MOVE UNIT-COST-OR TO UNIT-COST-PR
                  MOVE QUANTITY-OR TO QUANTITY-PR
                  MOVE TOTAL-COST TO TOTAL-COST-PR
                  MOVE DETAIL-INFORMATION TO OUTPUT-PRINTER-RECORD
                  WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 1 LINES
           END-READ.

       2500-Write-Page-Heading.
           add 1 to Line-Report-Counter
           move Date-Report-Record to Date-Formatted
           move Time-Report-Record to Time-Formatted
           move Page-Report-Counter to Page-Number
           write OUTPUT-PRINTER-RECORD from Page-Heading-Line
                           after advancing page.


       3000-WRITE-HEADING.
           add 1 to Line-Report-Counter
           MOVE HEADING-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 2 line
           MOVE SPACES TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 2 LINES.


       5000-WRITE-CONCLUSION.
           COMPUTE AVG-COST-OF-ITEM = GRAND-TOTAL /
                           INVENTORY-ACCUMULATOR
           COMPUTE AVG-COST-OF-PRODUCT = GRAND-TOTAL / PRODUCT-COUNTER
           MOVE PRODUCT-COUNTER TO PRODUCTS-CL
           MOVE PRODUCT-CONCLUSION-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 3 LINES
           MOVE INVENTORY-ACCUMULATOR TO INVENTORY-CL
           MOVE INVENTORY-CONCLUSION-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 1 LINES
           MOVE GRAND-TOTAL TO GRAND-TOTAL-CL
           MOVE TOTAL-COST-CONCLUSION-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 1 LINES
           MOVE AVERAGE-TOP-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 2 LINES
           MOVE AVG-COST-OF-ITEM TO AVG-COST-OF-ITEM-CL
           MOVE AVG-COST-ITEM-CONCLUSION-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 1 LINE
           MOVE AVG-COST-OF-PRODUCT TO AVG-COST-OF-PROD-CL
           MOVE AVG-COST-PROD-CONCLUSION-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 1 LINE.

