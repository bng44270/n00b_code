       identification division.
       program-id.  prg13.
       author.  Andy Carlson.


       environment division.
       input-output section.
       file-control.
           select Indexed-File assign to disk "pg10idx.dat"
                  organization is indexed
                  access is random
                  record key is ss-num of disk-Record.

       data division.
       file section.
       fd Indexed-File.
       copy diskrec.

       working-storage section.
       copy gencode.
       01 string-date            pic x(30).
       01 screen-record.
           03 ss-num             pic x(9).
           03 first-name         pic x(15).
           03 last-name          pic x(15).
           03 dependants         pic xx.
           03 ytd-total          pic $(8)9.99.
           03 period-total       pic $(8)9.99.
           03 ytd-commission     pic $(8)9.99.
           03 period-commission  pic $(8)9.99.
           03                    pic x(12).

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
                  dd of date-accept-record delimited by size
                  ", 20" delimited by size
                  yy of date-accept-record delimited by size
                  into String-Date

           open input Indexed-File
           perform 1500-Search-Data
               until ss-num of disk-record = "X"
           close Indexed-File
           stop run.

       1500-Search-Data.
           display spaces at 0101 erase eos
           display string-date at 0110
           display time-report-record at 0140
           display "car3872's Database" at 0220
           display "Please Enter SS#" at 0323
           display "Type <x> to quit" at 2520
           accept ss-num of disk-record at 0340
           read Indexed-File
               invalid key
                 call "CBL_TOUPPER" using ss-num of disk-record
                 if ss-num of disk-record not = "X"
                   display spaces at 0401 erase eos
                   display "Invalid Record" at 2420
                   display "Press <Enter> to Continue" at 2440
                   stop spaces
                   display spaces at 0101 erase eos
                   initialize disk-record
                 end-if
               not invalid key
                   display spaces at 0401 erase eos
                   move corresponding disk-record to screen-record
                   display "First Name" at 0504
                   display first-name of screen-record at 0516
                   display "Last Name" at 0540
                   display last-name of screen-record at 0551
                   display "Dependants" at 0704
                   display dependants of screen-record at 0716
                   display "Period Records:" at 0910
                   display "YTD Records:" at 0930
                   display "Sales" at 1102
                   display "Commis'n" at 1302
                   display period-total of screen-record at 1115
                   display ytd-total of screen-record at 1135
                   display period-commission of screen-record at 1315
                   display ytd-commission of screen-record at 1335
                   display "Record Found!" at 2420
                   display "Press <Enter> to continue" at 2440
                   stop spaces
                   display spaces at 0101 erase eos
                   initialize disk-record
           end-read

