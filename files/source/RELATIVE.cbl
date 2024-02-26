      *> Copyright (c) 2005 - 2023 Veryant. Users of isCOBOL
      *> may freely modify and redistribute this program.

       program-id. relative.
       environment division.
       input-output section.
       file-control.
           select file1 assign to "FileRelative"
                 organization is relative
                 relative key is key-val
                 file status is file-status.

       data division.
       file section.
       fd  file1.
       01  file1-rec.
           03 file1-field-1       pic 99.
           03 file1-field-2       pic x(20).

       working-storage section.
       77  file-status             pic x(2).
       01  crerr-status.
           03 crerr-file-status    pic xx.
           03 crerr-ext-status     pic x(128).
       77  crerr-mesage            pic x any length.

       77  rerrname                pic x(50).
       77  fileop                  pic x(50).
       77  key-val                 pic 9(5) value 0.

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
       END DECLARATIVES.

       MAIN.
           display " "
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
           move 0 to key-val
           perform 3 times
              add 1 to key-val
              move 1       to file1-field-1 
              move "00xxx" to file1-field-2
              write file1-rec
           end-perform

      *start
           display " " 
           display "Getting the first record..." 
           move low-value to key-val

           start file1 key not < key-val
              invalid
                 continue
           end-start

      *read next
           display " "
           display "Reading next record..."
           read file1 next 

      *rewrite current record
           display " "  
           display "Rewriting into file..."  

           move 2      to file1-field-1 
           move "bbb"  to file1-field-2
           rewrite file1-rec

      *close
           display " "
           display "Closing file..."
           close file1
           
           goback.
