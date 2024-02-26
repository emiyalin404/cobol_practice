      *> Copyright (c) 2005 - 2023 Veryant. Users of isCOBOL
      *> may freely modify and redistribute this program.

       program-id. linesequential.
       environment division.
       input-output section.
       file-control.
           select file1 assign to "FileLineSequential"
                 organization is line sequential
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
           display "Creating and opening file..."
           open output file1

      *record writing
           display " "  
           display "Writing into file..."  
           move 0 to file1-field-1.
           perform 5 times
              add 1 to file1-field-1
              move "aaa"  to file1-field-2
              write file1-rec
           end-perform

      *close file  
           display " "  
           display "Closing file..."
           close file1

      *open file for i-o 
           display " "  
           display "Opening file..."
           open i-o file1

      *read 1 record
           display " "  
           display "Reading next record..."
           read file1 next

      *rewrite current record
           display " "  
           display "Rewriting into file..."  

           move "bbb"  to file1-field-2
           rewrite file1-rec

      *close
           display " "  
           display "Closing file..."
           close file1

           goback
           .

