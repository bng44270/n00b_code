       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PRG5.
       AUTHOR.  Andy Carlson.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ORIGINAL-FILE ASSIGN TO "PRG05.DAT"
                                   ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-PRINTER-FILE ASSIGN TO PRINTER "CON:".

       DATA DIVISION.
       FILE SECTION.
       FD ORIGINAL-FILE.
       01 ORIGINAL-RECORD.
           03 STORE-NUMBER-OR          PIC X(2).
           03 DEPARTMENT-NUMBER-OR     PIC X(2).
           03 PRODUCT-CODE-OR          PIC X(10).
           03 DESCRIPTION-OR           PIC X(20).
           03 UNIT-COST-OR             PIC 99999V99.
           03 QUANTITY-OR              PIC 9(6).
           03 RETAIL-PRICE-OR          PIC 99999V99.

       FD OUTPUT-PRINTER-FILE.
       01 OUTPUT-PRINTER-RECORD        PIC X(100).

       WORKING-STORAGE SECTION.

       01 DETAIL-INFORMATION.
           03 DESCRIPTION-PR           PIC X(20).
           03                          PIC X(5) VALUE SPACES.
           03 PRODUCT-CODE-PR          PIC X(10).
           03                          PIC X(5) VALUE SPACES.
           03 UNIT-COST-PR             PIC $$$$9.99.
           03                          PIC X(5) VALUE SPACES.
           03 QUANTITY-PR              PIC ZZZZZ9.

       01 MISC-AND-COUNTER-LIST.
           03 PRODUCT-COUNTER          PIC 9(2) VALUE ZEROS.
           03 INVENTORY-ACCUMULATOR    PIC 9(6) VALUE ZEROS.
           03 EOF-MARKER               PIC X(3) VALUE "NO".

       01 HEADING-LINE.
           03                          PIC X(11) VALUE "DESCRIPTION".
           03                          PIC X(14) VALUE SPACES.
           03                          PIC X(10) VALUE "PROD. CODE".
           03                          PIC X(5) VALUE SPACES.
           03                          PIC X(9) VALUE "UNIT COST".
           03                          PIC X(4) VALUE SPACES.
           03                          PIC X(8) VALUE "QUANTITY".

       01 PRODUCT-CONCLUSION-LINE.
           03                          PIC X(8) VALUE "PRODUCTS".
           03                          PIC X(3) VALUE SPACES.
           03 PRODUCTS-CL              PIC Z9.

       01 INVENTORY-CONCLUSION-LINE.
           03                          PIC X(9) VALUE "INVENTORY".
           03                          PIC X(6) VALUE SPACES.
           03 INVENTORY-CL             PIC ZZZZZ9.

       PROCEDURE DIVISION.

       1000-MAIN-LOGIC.
           OPEN INPUT ORIGINAL-FILE
           OPEN OUTPUT OUTPUT-PRINTER-FILE
           READ ORIGINAL-FILE
               AT END MOVE "YES" TO EOF-MARKER
           END-READ
           PERFORM 3000-WRITE-HEADING
           PERFORM 2000-READ-ORIGINAL-FILE
               UNTIL EOF-MARKER="YES"
           PERFORM 5000-WRITE-CONCLUSION
           CLOSE ORIGINAL-FILE
           CLOSE OUTPUT-PRINTER-FILE
           STOP RUN.

       2000-READ-ORIGINAL-FILE.
           ADD 1 TO  PRODUCT-COUNTER
           ADD QUANTITY-OR TO INVENTORY-ACCUMULATOR
           PERFORM 4000-MOVE-RECORDS
           READ ORIGINAL-FILE
               AT END MOVE "YES" TO EOF-MARKER
           END-READ.

       3000-WRITE-HEADING.
           MOVE HEADING-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING PAGE
           MOVE SPACES TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 2 LINES.

       4000-MOVE-RECORDS.
           MOVE PRODUCT-CODE-OR TO PRODUCT-CODE-PR
           MOVE DESCRIPTION-OR TO DESCRIPTION-PR
           MOVE UNIT-COST-OR TO UNIT-COST-PR
           MOVE QUANTITY-OR TO QUANTITY-PR
           MOVE DETAIL-INFORMATION TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 1 LINES.

       5000-WRITE-CONCLUSION.
           MOVE PRODUCT-COUNTER TO PRODUCTS-CL
           MOVE PRODUCT-CONCLUSION-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 3 LINES
           MOVE INVENTORY-ACCUMULATOR TO INVENTORY-CL
           MOVE INVENTORY-CONCLUSION-LINE TO OUTPUT-PRINTER-RECORD
           WRITE OUTPUT-PRINTER-RECORD AFTER ADVANCING 1 LINES.

