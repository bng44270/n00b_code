       identification division.
       program-id.  prg14.
       author.  Andy Carlson.


       environment division.
       input-output section.
       file-control.
           select Indexed-File assign to disk "pg10idx.dat"
                  organization is indexed
                  access is random
                  record key is ss-num-dr.

       data division.
       file section.
       fd Indexed-File.
       copy dr14.
