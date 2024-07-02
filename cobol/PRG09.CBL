       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PRG8.
       AUTHOR.  Andy Carlson.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ORIGINAL-FILE ASSIGN TO "u:\cobol\PRG08.DAT"
                                   ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-PRINTER-FILE ASSIGN TO PRINTER "lpt1".
           select sort-work-file assign to disk.

       DATA DIVISION.
       FILE SECTION.
       sd sort-work-file.
       01 sort-record.
           03 STORE-NUMBER-sR          PIC X(2).
           03 DEPARTMENT-NUMBER-sR     PIC X(2).
           03 PRODUCT-CODE-sR          PIC X(10).
           03 DESCRIPTION-sR           PIC X(20).
           03 UNIT-COST-sR             PIC 99999V99.
           03 QUANTITY-sR              PIC 999999.
           03 RETAIL-COST-sR           PIC 99999V99.

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
           03                          PIC X(6) VALUE SPACES.
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
      *    End of Record
           03 eor-marker               pic x(3) value "NO".
               88 end-of-record        value "YES".
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
      *    Default Department Being Used
           03 Dept-Def-Key-Hold        pic xx.
      *    Default Store Being Used
           03 Store-Def-Key-Hold       pic xx.
      *    Checks for first pass through loop
           03 Loop-Checker             pic 9.
               88 First-Time           value 1.
           03 Dept-Total-Cost          pic 9(10)v99 value zero.
           03 Store-Total-Cost         pic 9(10)v99 value zero.
           03 Dept-Inv-Counter         pic 9(5) value zero.
           03 Store-Inv-Counter        pic 9(5) value zero.
           03 Day-Value                pic 9.

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

       01 Dept-Control-Break-Line.
           03                          pic x(5) value "With".
           03 Report-Dept-Counter      pic z(5).
           03                          pic x(31)
               value " Products, Merchandise is worth".
           03 Report-Dept-Cost         pic $(9)9.99.
           03                          pic x(11)
               value " in Dept. #".
           03 Report-Dept-Number       pic xx.

       01 Store-Control-Break-Line.
           03                          pic x(5) value "With".
           03 Report-Store-Counter     pic z(5).
           03                          pic x(31)
               value " Products, Merchandise is worth".
           03 Report-Store-Cost        pic $(9)9.99.
           03                          pic x(12)
               value " in Store #".
           03 Report-Store-Number       pic xx.

       01 Page-Heading-Line.
           03 String-Report-Date       pic x(30).
           03                          pic x(28)
                       value "car3872's Business Report".
           03 Time-Formatted            pic x(8).
           03                          pic x(4) value space.
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
      *Month and Day
       01 Day-Of-Week-Name.
           03 pic x(10) value "Monday".
           03 pic x(10) value "Tuesday".
           03 pic x(10) value "Wednesday".
           03 pic x(10) value "Thursday".
           03 pic x(10) value "Friday".
           03 pic x(10) value "Saturday".
           03 pic x(10) value "Sunday".
       01 redefines Day-Of-Week-Name.
           03 Days-Of-Week pic x(10) occurs 7 times.

       01 Months.
           03 pic x(10) value "January".
           03 pic x(10) value "February".
           03 pic x(10) value "March".
           03 pic x(10) value "April".
           03 pic x(10) value "May".
           03 pic x(10) value "June".
           03 pic x(10) value "July".
           03 pic x(10) value "August".
           03 pic x(10) value "September".
           03 pic x(10) value "October".
           03 pic x(10) value "November".
           03 pic x(10) value "December".
       01 redefines Months.
           03 Month-List pic x(10) occurs 12 times.


       PROCEDURE DIVISION.

       1000-MAIN-LOGIC.
      *Date Work
           Accept Day-Value from Day-Of-Week
           Accept Time-Accept-Record from Time
           move hh-tar to hh-trr
           move mm-tar to mm-trr
           move ss-tar to ss-trr
           accept Date-Accept-Record from Date
           move mm-dar to mm-drr
           move dd-dar to dd-drr
           move yy-dar to yy-drr
           string Days-Of-Week (Day-Value) delimited by space
                  ", " delimited by size
                  Month-List (mm-dar) delimited by space
                  " " delimited by size
                  dd-dar delimited by zeros
                  ", 20" delimited by size
                  yy-dar delimited by size
                  into String-Report-Date

           sort sort-work-file
               ascending key Store-number-sr
                             Department-number-sr
                             product-code-sr
               input procedure begin-sort
               output procedure finish-sort
               stop run.
       begin-sort.
           initialize Line-Report-Counter Page-Report-Counter
           move 1 to Loop-Checker
           OPEN INPUT ORIGINAL-FILE
           open output output-printer-file
           move 1 to Page-Report-Counter
           perform 2500-Write-Page-Heading
           PERFORM 3000-WRITE-HEADING
           PERFORM 2000-READ-ORIGINAL-FILE
               UNTIL END-OF-FILE
           close output-printer-file
           CLOSE ORIGINAL-FILE.

       finish-sort.
           open output Output-Printer-File
           perform until end-of-record
             return Sort-Work-File into output-printer-record
               at end
                 move "YES" to eor-marker
               not at end
                 move PrODUCT-CODE-sR to product-code-pr
                 move DESCRIPTION-sR to description-pr
                 move UNIT-COST-sR to unit-cost-pr
                 move QUANTITY-sR to quantity-pr
                 move total-cost to total-cost-pr
                 write Output-Printer-Record from detail-information
             end-return
           end-perform
           perform 2600-Dept-Control-Break
           perform 2700-Store-Control-Break
           PERFORM 5000-WRITE-CONCLUSION
           close output-printer-file.

       2000-READ-ORIGINAL-FILE.
           READ ORIGINAL-FILE
               AT END MOVE "YES" TO EOF-MARKER
               NOT AT END
                  if store-number-or = 01 and department-number-or = 04
                    release sort-record from original-record
                    add QUANTITY-OR to Dept-Inv-Counter
                    add QUANTITY-OR to Store-Inv-Counter
                    add 1 to Line-Report-Counter
                    ADD 1 TO  PRODUCT-COUNTER
                    ADD QUANTITY-OR TO INVENTORY-ACCUMULATOR
                    COMPUTE TOTAL-COST = QUANTITY-OR * UNIT-COST-OR
                    add TOTAL-COST to Dept-Total-Cost
                    add TOTAL-COST to Store-Total-Cost
                    ADD TOTAL-COST TO GRAND-TOTAL
                  end-if
           END-READ.

       2500-Write-Page-Heading.
           add 1 to Line-Report-Counter
           move Time-Report-Record to Time-Formatted
           move Page-Report-Counter to Page-Number
           write OUTPUT-PRINTER-RECORD from Page-Heading-Line
                           after advancing page.

       2600-Dept-Control-Break.
           write OUTPUT-PRINTER-RECORD from spaces after advancing 1
           move Dept-Def-Key-Hold to Report-Dept-Number
           move Dept-Inv-Counter to Report-Dept-Counter
           move Dept-Total-Cost to Report-Dept-Cost
           write OUTPUT-PRINTER-RECORD from Dept-Control-Break-Line
                       after advancing 1
           write OUTPUT-PRINTER-RECORD from spaces after advancing 1
           move DEPARTMENT-NUMBER-OR to Dept-Def-Key-Hold
           add 3 to Line-Report-Counter
           initialize Dept-Inv-Counter Dept-Total-Cost.

       2700-Store-Control-Break.
           write OUTPUT-PRINTER-RECORD from spaces after advancing 1
           move Store-Def-Key-Hold to Report-Store-Number
           move Store-Inv-Counter to Report-Store-Counter
           move Store-Total-Cost to Report-Store-Cost
           write OUTPUT-PRINTER-RECORD from Store-Control-Break-Line
                       after advancing 1
           write OUTPUT-PRINTER-RECORD from spaces after advancing 1
           move STORE-NUMBER-OR to Store-Def-Key-Hold
           add 3 to Line-Report-Counter
           initialize Store-Inv-Counter Store-Total-Cost.

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
