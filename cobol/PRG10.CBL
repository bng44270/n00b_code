       identification division.
       program-id.  prg10.
       author.  Andy Carlson.

       environment division.
       input-output section.
       file-control.
           select Indexed-File assign to disk "pg10idx.dat"
                  organization is indexed
                  access is sequential
                  record key is ss-num of disk-record.

           select Output-File assign to 'con:'.

       data division.
       file section.
       fd Indexed-File.
       copy diskrec.

       fd Output-File
          report is output-report.

       working-storage section.
       copy gencode.
       copy nametab.
       01 redefines name-table.
           03 names-table occurs 28 times.
               05 ss-num         pic x(9).
               05 first-name     pic x(15).
               05 last-name      pic x(15).
               05 dependants     pic x(2).
               05 status-code    pic x.
               05                pic x(8).


      *Index
       01 i                    pic 99.

       01 Other-Info.
           03 comments             pic x(11).
       01 error-count          pic 99 value zero.
       01 good-count           pic 99 value zero.
       01 total-count          pic 99 value zero.
       01 string-date          pic x(30).

       report section.
       rd output-report
          page limit is 60 lines
          first detail  5
          last  detail  55.
       01 header-line type is page heading.
           03 line 1.
               05 column 25            pic x(13) value "Report Writer".
           03 line plus 1.
               05 column 1             pic x(30) source string-date.
               05 column 40            pic x(8) source
                                               time-report-record.
               05 column 50            pic x(5) value "Page ".
               05 column 56            pic 99 source page-counter.
           03 line plus 1.
               05 column 5             pic x(9) value "SS #".
               05 column 16            pic x(10) value "First Name".
               05 column 31            pic x(9) value "Last Name".
               05 column 46            pic x(10) value "Dep.".
               05 column 52            pic x(6) value "Stat".
               05 column 56            pic x(7) value " Errors".
           03 line plus 1.
               05 column 1             pic x(20) value spaces.
       01 detail-info type is detail line plus 1.
           03 line plus 1.
               05 column 3             pic x(9)    source ss-num of
                                                   names-table (i).
               05 column 14            pic x(15)   source first-name of
                                                   names-table (i).
               05 column 31            pic x(15)   source last-name of
                                                   names-table (i).
               05 column 46            pic xx      source dependants of
                                                   names-table (i).
               05 column 52            pic x       source status-code of
                                                   names-table (i).
               05 column 56            pic x(11)   source comments of
                                                   other-info.

       01 conclusion-line type is control footing final.
           03 line plus 2.
               05 column 10            pic x(10) value "Records:".
           03 line plus 1.
               05 column 15            pic x(5) value "Total".
               05 column 25            pic z9 source total-count.
           03 line plus 1.
               05 column 15            pic x(5) value "Good".
               05 column 25            pic z9 source good-count.
           03 line plus 1.
               05 column 15            pic x(3) value "Bad".
               05 column 25            pic z9 source error-count.


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

           open output Indexed-File
           open output Output-File
           initiate output-report
           perform 2000-Write-Table varying i
               from 1 by 1 until i > 28
                terminate output-report
           close Output-File
           close Indexed-File
           stop run.

       2000-Write-Table.
           if (ss-num of names-table (i) not numeric)
              or (first-name of names-table (i) = spaces)
              or (last-name of names-table (i) = spaces)
              or (dependants of names-table (i) not numeric)
              or (status-code of names-table (i) not = "A")
                move "Entry Error" to comments of other-info
                generate detail-info
                add 1 to error-count
                add 1 to total-count
              else
                initialize disk-record
                move corresponding names-table (i) to disk-record
                write disk-record
                  invalid key
                    move "Invalid Key" to comments of other-info
                    generate detail-info
                    add 1 to error-count
                  not invalid key
                    move "None" to comments of other-info
                    generate detail-info
                    add 1 to good-count
                end-write
                add 1 to total-count
            end-if.
