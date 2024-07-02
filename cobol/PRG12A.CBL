       identification division.
       program-id.  prg12a.
       author.  Andy Carlson.

       environment division.
       input-output section.
       file-control.
           select LNS-Tran-FIle assign to disk "u:\cobol\ksdstran.lns"
                  organization is line sequential.

           select Valid-Tran-File assign to disk "valid-tran.dat"
                  organization is line sequential.

           select Output-File assign to "con:".

       data division.
       file section.
       fd Valid-Tran-File.
       01 Valid-Tran-Record.
           03 ss-num           pic x(9).
           03 action           pic x.
           03 first-name       pic x(15).
           03 last-name        pic x(15).
           03 dependants       pic xx.
           03 status-code      pic x.
           03 sales-increase   pic x(8).


       fd LNS-Tran-File.
       01 LNS-Tran-Record.
           03 ss-num           pic x(9).
           03 action           pic x.
               88 valid-tran   value 'A' 'D' 'P' 'C'.
           03 first-name       pic x(15).
           03 last-name        pic x(15).
           03 dependants       pic xx.
           03 status-code      pic x.
           03 sales-increase   pic x(8).

       fd Output-File
          report is Output-Report.

       working-storage section.
       copy gencode.
       01 string-date          pic x(30).
       01 comments             pic x(14).
       01 error-counters.
           03 codes            pic 999.
           03 a-count          pic 999.
           03 d-count          pic 999.
           03 c-count          pic 999.
           03 p-count          pic 999.
           03 total            pic 999.
       01 good-counters.
           03 a-count          pic 999.
           03 d-count          pic 999.
           03 c-count          pic 999.
           03 p-count          pic 999.
           03 total            pic 999.
       01 eof-flag             pic xxx value spaces.
           88 end-of-file      value 'YES'.

       report section.
       rd Output-Report
           page limit is 60 lines
           first detail 6
           last detail 52.
       01 heading-line type is page heading.
           03 line 1.
               05 column 25            pic x(30)
                           value "car3872's Report for Prog 12a".
           03 line plus 1.
               05 column 1             pic x(30) source string-date.
               05 column 40            pic x(8)
                           source time-report-record.
               05 column 50            pic x(5) value 'Page '.
               05 column 57            pic 99 source page-counter.
           03 line plus 1.
               05 column 1             pic x(6) value 'Action'.
               05 column 12            pic x(9) value 'SS #'.
               05 column 24            pic x(10) value 'First Name'.
               05 column 42            pic x(9) value 'Last Name'.
               05 column 54            pic x(10) value 'Dependants'.
               05 column 66            pic x(4) value 'Stat'.
           03 line plus 1.
               05 column 44            pic x(11)
                           value 'Sales Incr.'.
               05 column 56            pic x(8) value 'Comments'.
           03 line plus 1.
               05 column 1             pic x value spaces.

       01 detail-line type is detail line plus 1.
           03 line plus 1.
               05 column 4             pic x
                           source action of LNS-Tran-Record.
               05 column 8             pic x(9)
                           source ss-num of LNS-Tran-Record.
               05 column 20            pic x(15)
                           source first-name of LNS-Tran-Record.
               05 column 38            pic x(15)
                           source last-name of LNS-Tran-Record.
               05 column 53            pic xx
                           source dependants of LNS-Tran-Record.
               05 column 68            pic x
                           source status-code of LNS-Tran-Record.
           03 line plus 1.
               05 column 46            pic x(8)
                           source sales-increase of LNS-Tran-Record.
               05 column 56            pic x(14)
                           source comments.
       01 conclusion-line type is control footing final.
           03 line plus 1.
               05 column 10            pic x(5) value 'Good:'.
               05 column 25            pic x(4) value 'Bad:'.
           03 line plus 1.
               05 column 11            pic x(6) value 'Adding'.
               05 column 19            pic zz9
                           source a-count of good-counters.
               05 column 26            pic x(6) value 'Adding'.
               05 column 35            pic zz9
                           source a-count of error-counters.
           03 line plus 1.
               05 column 11            pic x(8) value 'Changing'.
               05 column 19            pic zz9
                           source c-count of good-counters.
               05 column 26            pic x(8) value 'Changing'.
               05 column 35            pic zz9
                           source c-count of error-counters.
           03 line plus 1.
               05 column 11            pic x(8) value 'Deleting'.
               05 column 19            pic zz9
                           source d-count of good-counters.
               05 column 26            pic x(8) value 'Deleting'.
               05 column 35            pic zz9
                           source d-count of error-counters.
           03 line plus 1.
               05 column 11            pic x(7) value 'Posting'.
               05 column 19            pic zz9
                           source p-count of good-counters.
               05 column 26            pic x(7) value 'Posting'.
               05 column 35            pic zz9
                           source p-count of error-counters.
           03 line plus 1.
               05 column 26            pic x(6) value "Action".
               05 column 35            pic zz9
                           source codes of error-counters.

           03 line plus 1.
               05 column 11            pic x(7) value 'Total'.
               05 column 19            pic zz9
                           source total of good-counters.
               05 column 26            pic x(7) value 'Total'.
               05 column 35            pic zz9
                           source total of error-counters.

       procedure division.
       1000-Main-Logic.
      *    Date Making Lines
           accept date-accept-record from date
           accept time-accept-record from time
           accept day-number from day-of-week
           move corresponding time-accept-record to time-report-record
           string Days-Of-Week (Day-number) delimited by space
                  ", " delimited by size
                  Month-List (mm of date-accept-record)
                    delimited by space
                  " " delimited by size
                  dd of date-accept-record delimited by zeros
                  ", 20" delimited by size
                  yy of date-accept-record delimited by size
                  into String-Date
           initialize good-counters error-counters
           open input LNS-Tran-File
           open output Valid-Tran-File
           open output Output-File
           initiate Output-Report
           perform 1500-Read-Validate-Write until end-of-file
           terminate Output-Report
           close LNS-Tran-File
                 Valid-Tran-File
                 Output-File

           stop run.

       1500-Read-Validate-Write.
           read LNS-Tran-File
             at end move "YES" to eof-flag
             not at end
               initialize valid-tran-record
               if not valid-tran
                   move "Invalid Action" to comments
                   generate detail-line
                   add 1 to codes of error-counters
                   add 1 to total of error-counters
               else
                 if action of LNS-Tran-Record = 'A'
                   if (ss-num of LNS-Tran-Record not numeric) or
                      (first-name of LNS-Tran-Record = spaces) or
                      (last-name of LNS-Tran-Record = spaces) or
                      (dependants of LNS-Tran-Record not numeric) or
                      (status-code of LNS-Tran-Record not = 'A')
                        move "Add Error" to comments
                        generate detail-line
                        add 1 to a-count of error-counters
                        add 1 to total of error-counters
                   else
                     move corresponding LNS-Tran-Record
                               to Valid-Tran-Record
                     write Valid-Tran-Record
                     add 1 to a-count of good-counters
                     add 1 to total of good-counters
                   end-if
                 else
                 if action of LNS-Tran-Record = 'C'
                   if ss-num of LNS-Tran-Record not numeric or
                      (first-name of LNS-Tran-Record = spaces and
                      last-name of LNS-Tran-Record = spaces and
                      dependants of LNS-Tran-Record not numeric) or
                      (dependants of LNS-Tran-Record not = spaces and
                      dependants of LNS-Tran-Record not numeric)
                        move "Change Error" to comments
                        generate detail-line
                        add 1 to c-count of error-counters
                        add 1 to total of error-counters
                   else
                     move corresponding LNS-Tran-Record
                               to Valid-Tran-Record
                     write Valid-Tran-Record
                     add 1 to c-count of good-counters
                     add 1 to total of good-counters
                   end-if
                 else
                 if action of LNS-Tran-Record = 'D'
                   if (ss-num of LNS-Tran-Record not numeric)
                     move "Delete Error" to comments
                     generate detail-line
                     add 1 to d-count of error-counters
                     add 1 to total of error-counters
                   else
                     move corresponding LNS-Tran-Record
                               to Valid-Tran-Record
                     write Valid-Tran-Record
                     add 1 to d-count of good-counters
                     add 1 to total of good-counters
                   end-if
                 else
                 if action of LNS-Tran-Record = 'P'
                   if (ss-num of LNS-Tran-Record not numeric) or
                      (sales-increase of LNS-Tran-Record not numeric)
                        move "Post Error" to comments
                        generate detail-line
                        add 1 to p-count of error-counters
                        add 1 to total of error-counters
                   else
                     move corresponding LNS-Tran-Record
                               to Valid-Tran-Record
                     write Valid-Tran-Record
                     add 1 to p-count of good-counters
                     add 1 to total of good-counters
                   end-if
               end-if
           end-read.
