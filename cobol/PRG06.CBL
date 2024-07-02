       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PRG6.
       AUTHOR.  Andy Carlson.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ORIGINAL-FILE ASSIGN TO "PRG06.DAT"
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
           03 PRODUCT-COUNTER          PIC 9(2) VALUE ZEROS.
           03 INVENTORY-ACCUMULATOR    PIC 9(6) VALUE ZEROS.
           03 EOF-MARKER               PIC X(3) VALUE "NO".
               88 END-OF-FILE          VALUE "YES".
           03 GRAND-TOTAL              PIC 9(9)V99 VALUE ZEROS.
           03 TOTAL-COST               PIC 9(8)V99 VALUE ZEROS.
           03 AVG-COST-OF-ITEM         PIC 9(4)V99 VALUE ZEROS.
           03 AVG-COST-OF-PRODUCT      PIC 9(4)V99 VALUE ZEROS.


       01 HEADING-LINE.
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
           OPEN INPUT ORIGINAL-FILE
           OPEN OUTPUT OUTPUT-PRINTER-FILE
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

       3000-WRITE-HEADING.
           MOVE HEADING-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING PAGE
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

