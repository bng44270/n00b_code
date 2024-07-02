       identification division.
       program-id.  prg11.
       author.  Andy Carlson.

       environment division.
       input-output section.
       file-control.
           select Indexed-File assign to disk "u:\pg10idx.dat"
                  organization is indexed
                  access is sequential
                  record key is ss-num of disk-record.

           select Output-File assign to 'con:'.

       data division.
       file section.
       fd indexed-file.
       copy u:\cobol\diskrec.

       fd output-file
          report is output-report.

       working-storage section.
       copy u:\cobol\gencode.

       01 string-date          pic x(30).
       01 total-count          pic 99 value zero.
       01 eof-error            pic xxx value space.
           88 end-of-file      value 'YES'.

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
               05 column 52            pic x(6) value "Status".
           03 line plus 1.
               05 column 46            pic x(6) value "Sales".
               05 column 52            pic x(9) value "Comission".

       01 detail-info type is detail line plus 1.
           03 line plus 2.
               05 column 3             pic x(9)    source ss-num of
                                                   disk-record.
               05 column 14            pic x(15)   source first-name of
                                                   disk-record.
               05 column 31            pic x(15)   source last-name of
                                                   disk-record.
               05 column 46            pic xx      source dependants of
                                                   disk-record.
               05 column 52            pic x       source status-code of
                                                   disk-record.
           03 line plus 1.
               05 column 31            pic x(8) value "Present".
               05 column 46            pic $$$,$$$,$$z.99
                           source period-total of disk-record.
               05 column 52            pic $$$,$$$,$$z.99
                           source ytd-total of disk-record.
           03 line plus 1.
               05 column 31            pic x(6) value "Y-T-D:".
               05 column 46            pic $$$,$$$,$$z.99
                           source period-commission of disk-record.
               05 column 52            pic $$$,$$$,$$z.99
                           source ytd-commission of disk-record.

       01 conclusion-line type is control footing final.
           03 line plus 2.
               05 column 10            pic x(10) value "Records:".
           03 line plus 1.
               05 column 15            pic x(5) value "Total".
               05 column 25            pic z9 source total-count.

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

           open input indexed-file
           open output output-file
           initiate output-report
           perform 2000-read-file until end-of-file
           terminate output-report
           close output-file
           close indexed-file
           stop run.

       2000-read-file.
           read indexed-file
             at end
               move "YES" to eof-error
             not at end
                   generate detail-info
                   add 1 to total-count
           end-read.
