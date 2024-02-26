      *> Copyright (c) 2005 - 2023 Veryant. Users of isCOBOL
      *> may freely modify and redistribute this program.

       identification division.
       program-id. indexed.

       environment division.
       input-output section.
       file-control.
           select file1 assign to "FileIndexed"
                 organization is indexed
                 access is dynamic
                 record key is key-file1
                 lock mode is manual
                 file status is file-status.

       data division.
       file section.
       fd  file1.
       01  rec-file1.
           03 key-file1   pic 99.
           03 data-file1  pic x(20).

       working-storage section.
       77  file-status             pic x(2).
       01  crerr-status.
           03 crerr-file-status    pic xx.
           03 crerr-ext-status     pic x(128).
       77  crerr-mesage            pic x any length.

       77  rerrname                pic x(50).
       77  fileop                  pic x(50).

       procedure division.
       declaratives.
       FILE1-ERROR section.
           use after error procedure on file1.
           call "C$RERR"          using crerr-status
                                        crerr-mesage
           call "C$RERRNAME"      using rerrname
           call "C$GETLASTFILEOP" using fileOp
           display " "  
           display "Error " crerr-file-status " " 
                   function trim(crerr-ext-status)
                   " on " rerrname
           display crerr-mesage
           display "on statement " fileOp.
       end declaratives.

       MAIN.
      *creates the file
           display "Creating file..."
           open output file1
           close file1

      *opening 
           display " "
           display "Opening file..."
           open i-o file1

      *record writing
           display " "
           display "Writing into file..."
           move 01     to key-file1
           move "aaa"  to data-file1
           write rec-file1

      *start
           display " "
           display "Getting the first record..."
           move low-values    to key-file1
           start file1 key not < key-file1

      *read next
           display " "
           display "Reading next record..."
           read file1 next

      *record rewriting
           display " "
           display "Rewriting into file..."
           move 01     to key-file1
           move "bbb"  to data-file1
           rewrite rec-file1

      *record delete
           display " "
           display "Deleting the record into file..."
           move 01  to key-file1
           delete file1 record

      *close
           display " "
           display "Closing file..."
           close file1

           goback.

