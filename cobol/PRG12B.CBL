       identification division.
       program-id.  prg12b.
       author.  Andy Carlson.

       environment division.
       input-output section.
       file-control.
           select Valid-Tran-File assign to disk "valid-tran.dat"
                  organization is line sequential.

           select Indexed-File assign to disk "pg10idx.dat"
                  organization is indexed
                  access is random
                  record key is ss-num of disk-Record.

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
           03 sales-increase   pic 9(6)v99.

       fd Indexed-File.
       copy diskrec.

       fd Output-File
          report is Output-Report.

       working-storage section.
       copy gencode.
       01 string-date          pic x(30).
       01 comments             pic x(14).
       01 eof-flag             pic xxx value spaces.
           88 end-of-file      value 'YES'.
       01 counters.
           03 a                pic 99.
           03 c                pic 99.
           03 d                pic 99.
           03 p                pic 99.
           03 total            pic 99.
       01 total-sales          pic 9(15)v99.

       report section.
       rd Output-Report
          page limit is 60 lines
          first detail 6
          last detail 55.
       01 heading-line type is page heading.
           03 line 1.
               05 column 25            pic x(30)
                           value "car3872's Report for Prog 12a".
           03 line plus 1.
               05 column 1             pic x(30) source string-date.
               05 column 40            pic x(8)
                           source time-report-record.
               05 column 50            pic x(5) value 'Page '.
               05 column 56            pic 99 source page-counter.
           03 line plus 1.
               05 column 4             pic x(9) value 'SS #'.
               05 column 19            pic x(10) value 'First Name'.
               05 column 36            pic x(9) value 'Last Name'.
               05 column 55            pic x(10) value 'Sales'.
               05 column 65            pic x(10) value "Commission".
           03 line plus 1.
               05 column 55            pic x(7) value "Depd'ts".
               05 column 66            pic x(8) value "Comments".
       01 detail-line type is detail line plus 1.
           03 line plus 1.
               05 column 2                 pic x(9)
                       source ss-num of disk-record.
               05 column 17                pic x(15)
                       source first-name of disk-record.
               05 column 34                pic x(15)
                       source last-name of disk-record.
               05 column 49                pic xxx value "Pd.".
               05 column 53                pic $$$,$$$,$$9.99
                       source period-total of disk-record.
               05 column 67                pic $$$,$$$,$$9.99
                       source period-commission of disk-record.
           03 line plus 1.
               05 column 49                pic xxx value "YTD".
               05 column 52                pic $$$,$$$,$$9.99
                       source ytd-total of disk-record.
               05 column 67                pic $$$,$$$,$$9.99
                       source ytd-commission of disk-record.
           03 line plus 1.
               05 column 57                pic xx
                       source dependants of disk-record.
               05 column 63                pic x(14)
                       source comments.
       01 conclusion-line type is control footing final.
           03 line plus 2.
               05 column 17                pic x(7) value "Totals:".
               05 column 33                pic x(6) value "Added:".
               05 column 45                pic z9
                       source a of counters.
           03 line plus 1.
               05 column 33                pic x(8) value "Changed:".
               05 column 45                pic z9
                       source c of counters.
           03 line plus 1.
               05 column 33                pic x(8) value "Deleted:".
               05 column 45                pic z9
                       source d of counters.
           03 line plus 1.
               05 column 33                pic x(7) value "Posted".
               05 column 45                pic z9
                       source p of counters.
           03 line plus 1.
               05 column 33                pic x(6) value "Total:".
               05 column 45                pic z9
                       source total of counters.
           03 line plus 1.
               05 column 33                pic x(12)
                       value "Total Sales:".
               05 column 47                pic $$$,$$$,$$$,$$$,$$9.99
                       source total-sales.

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

           initialize counters total-sales
           open i-o Indexed-File
           open input Valid-Tran-File
           open output Output-File
           initiate Output-Report
           perform 1500-Append-Indexed-File until end-of-file
           terminate Output-Report
           close Indexed-File
                 Valid-Tran-File
                 Output-File
           stop run.

       1500-Append-Indexed-File.
       read Valid-Tran-File
           at end
               move "YES" to eof-flag
           not at end
               initialize disk-record
               if action of Valid-Tran-Record = 'A'
                   add 1 to a of counters
                   add 1 to total of counters
                   initialize disk-record
                   move ss-num of Valid-Tran-Record to
                       ss-num of disk-record
                   read Indexed-File
                       invalid key
                           move corresponding Valid-Tran-Record
                               to disk-record
                           move "A" to status-code of disk-record
                           write disk-record
                           end-write
                           move "OK" to comments
                           generate detail-line
                       not invalid key
                           move "Record Present" to comments
                           generate detail-line
                   end-read
                   add period-total to total-sales
               end-if
               if action of Valid-Tran-Record = 'C'
                   add 1 to c of counters
                   add 1 to total of counters
                   move ss-num of Valid-Tran-Record
                       to ss-num of disk-record
                   read Indexed-File
                       invalid key
                           move "Not Found (C)" to comments
                           initialize disk-record
                           move corresponding Valid-Tran-Record
                               to disk-record
                           generate detail-line
                       not invalid key
                           move "Before Change" to comments
                           generate detail-line
                           if first-name of Valid-Tran-Record
                               not = spaces
                               move first-name of Valid-Tran-Record to
                                   first-name of disk-record
                           end-if
                           if last-name of Valid-Tran-Record
                               not = spaces
                               move last-name of Valid-Tran-Record to
                                   last-name of disk-record
                           end-if

                           if (dependants of Valid-Tran-Record
                                 not = spaces and
                             dependants of Valid-Tran-Record
                                 not numeric)

                               move dependants of Valid-Tran-Record to
                                   dependants of disk-record
                           end-if
                           if status-code of Valid-Tran-Record
                               not = spaces
                               move status-code of Valid-Tran-Record to
                                   status-code of disk-record
                           end-if
                           rewrite disk-record
                           end-rewrite
                           move "After Change" to comments
                           generate detail-line
                           add period-total to total-sales
                   end-read
               end-if
               if action of Valid-Tran-File = 'D'
                   add 1 to d of counters
                   add 1 to total of counters
                   move ss-num of Valid-Tran-Record to
                       ss-num of disk-record
                   read Indexed-File
                       invalid key
                           move "Not Fount (D)" to comments
                           generate detail-line
                       not invalid key
                           move "Item Deleted" to comments
                           generate detail-line
                           delete Indexed-File record
                           end-delete
                   end-read
               end-if
               if action of Valid-Tran-File = 'P'
                   add 1 to p of counters
                   add 1 to total of counters
                   move ss-num of Valid-Tran-Record to
                       ss-num of disk-record
                   read Indexed-File
                       invalid key
                           move "Post Error" to comments
                           generate detail-line
                       not invalid key
                           move "Before Post" to comments
                           generate detail-line
                           add sales-increase of Valid-Tran-Record to
                               period-total of disk-record
                           rewrite disk-record
                           end-rewrite
                           move "After Post" to comments
                           generate detail-line
                           add period-total to total-sales
                  end-read
              end-if
       end-read.

