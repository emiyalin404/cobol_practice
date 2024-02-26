      *> Copyright (c) 2005 - 2023 Veryant. Users of isCOBOL
      *> may freely modify and redistribute this program.

       identification division.
       program-id. SORT.

       environment division.
       input-output section.
       file-control.
           select sortfile assign to sort-work
                  file status is file-status.

           select inputfile assign to "InputFile"
                 organization is line sequential
                 file status is file-status.

       data division.
       file section.
       sd  sortfile.
       01  sortrec.
           05 sr-title       pic x(30).
           05 sr-length      pic x(5).
           05 sr-artist      pic x(20).
           05 sr-album       pic x(30).
           05 sr-genre       pic x(15).
           05 sr-label       pic x(30).
           05 sr-year        pic 9(4).

       fd  inputfile.
       01  input-rec.
           05 ir-title       pic x(30).
           05 ir-length      pic x(5).
           05 ir-artist      pic x(20).
           05 ir-album       pic x(30).
           05 ir-genre       pic x(15).
           05 ir-label       pic x(30).
           05 ir-year        pic 9(4).

       working-storage section.
       77  file-status             pic x(2).
       01  crerr-status.
           03 crerr-file-status    pic xx.
           03 crerr-ext-status     pic x(128).
       77  crerr-mesage            pic x any length.

       77  rerrname                pic x(50).
       77  fileop                  pic x(50).

       77  idx                     pic 9(3).

       01  display-data.
           05 ds-artist         pic x(20).
           05 filler            pic x(3) value " | ".
           05 ds-year           pic X(4).
           05 filler            pic x(3) value " | ".
           05 ds-album          pic x(30).
           05 filler            pic x(3) value " | ".
           05 ds-title          pic x(28).
           05 filler            pic x(3) value " | ".
           05 ds-length         pic x(20).

       procedure division.
       declaratives.
       SORTFILE-ERROR section.
           use after error procedure on sortfile.
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

       INPUTFILE-ERROR section.
           use after error procedure on inputfile.
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
           perform CREATE-INPUT-FILE.

           perform DISPLAY-INPUT-FILE.

           display " "
           display "Sort operation..."

           sort sortfile on descending key sr-artist,
                            ascending key sr-year,
                            ascending key sr-album,
                            ascending key sr-title,
                            descending key sr-length 
                input  procedure SORT-IN
                output procedure SORT-OUT.

           goback.

       SORT-IN.
           display " "
           display "Open the input file..."
           open input inputfile

           display " "
           display "Fill the sort file..."

           perform varying idx from 1 by 1 until idx > 20
              read inputfile next
                 at end
                    exit perform
              end-read
              move ir-title  to sr-title
              move ir-length to sr-length
              move ir-artist to sr-artist
              move ir-album  to sr-album
              move ir-genre  to sr-genre
              move ir-label  to sr-label
              move ir-year   to sr-year
              release sortrec
           end-perform.

           display " "
           display "close the input file..."
           close inputfile
           .

      ***---
       SORT-OUT.

           display " "
           display "Retrieve the data from the sort file..."

           perform DISPLAY-DATA-HEADER

           perform until 1 = 2
              return sortfile  
                 at end 
                    exit perform  
              end-return
              perform DISPLAY-RECORD
           end-perform.


       DISPLAY-RECORD.
           move sr-artist to ds-artist 
           move sr-year   to ds-year   
           move sr-album  to ds-album  
           move sr-title  to ds-title  
           move sr-length to ds-length 

           display display-data.

       DISPLAY-DATA-HEADER.
           display " "
           move "ARTIST"  to ds-artist 
           move "YEAR"    to ds-year   
           move "ALBUM"   to ds-album  
           move "TITLE"   to ds-title  
           move "LENGTH"  to ds-length 

           display display-data.

       CREATE-INPUT-FILE.
           open output inputfile

           move "Help!"                to ir-title     
           move "2:21"                 to ir-length    
           move "Beatles"              to ir-artist    
           move "Help!"                to ir-album     
           move "Pop"                  to ir-genre     
           move "Parlophone"           to ir-label     
           move 1965                   to ir-year      
           write input-rec

           move "Satisfaction"                    to ir-title     
           move "3:45"                            to ir-length    
           move "The Rolling Stones"              to ir-artist    
           move "Out of Our Heads"                to ir-album     
           move "Rock"                            to ir-genre     
           move "Decca/ABKCO"                     to ir-label     
           move 1965                              to ir-year      
           write input-rec

           move "Yesterday"           to ir-title     
           move "2:07"                to ir-length    
           move "Beatles"             to ir-artist    
           move "Help!"               to ir-album     
           move "Pop"                 to ir-genre     
           move "Parlophone"          to ir-label     
           move 1965                  to ir-year      
           write input-rec

           move "Rain Fall Down"              to ir-title     
           move "4:55"                        to ir-length    
           move "The Rolling Stones"          to ir-artist    
           move "A Bigger Bang"               to ir-album     
           move "Rock"                        to ir-genre     
           move "Polydor Records"             to ir-label     
           move 2005                          to ir-year      
           write input-rec

           move "Maria Maria"             to ir-title     
           move "4:19"                    to ir-length    
           move "Santana"                 to ir-artist    
           move "Supernatural"            to ir-album     
           move "Latin Rock"              to ir-genre     
           move "BMG Arista/Ariola"       to ir-label     
           move 1999                      to ir-year      
           write input-rec

           move "Foo Foo"                  to ir-title     
           move "6:29"                     to ir-length    
           move "Santana"                  to ir-artist    
           move "Shaman"                   to ir-album     
           move "Latin Rock"               to ir-genre     
           move "Arista"                   to ir-label     
           move 2002                       to ir-year      
           write input-rec

           move "After Midnight"             to ir-title     
           move "2:51"                       to ir-length    
           move "Eric Clapton"               to ir-artist    
           move "Eric Clapton"               to ir-album     
           move "Rock/Pop"                   to ir-genre     
           move "Atco, Polydor Records"      to ir-label     
           move 1970                         to ir-year      
           write input-rec

           move "Next Time You See Her"       to ir-title     
           move "4:02"                        to ir-length    
           move "Eric Clapton"                to ir-artist    
           move "Slowhand"                    to ir-album     
           move "Blues"                       to ir-genre     
           move "Polydor"                     to ir-label     
           move 1977                          to ir-year      
           write input-rec

           move "Albachiara"                       to ir-title     
           move "4:05"                             to ir-length    
           move "Vasco Rossi"                      to ir-artist    
           move "Non siamo mica gli americani"     to ir-album     
           move "Rock"                             to ir-genre     
           move "Lotus LOP"                        to ir-label     
           move 1979                               to ir-year      
           write input-rec

           move "Bollicine"                   to ir-title     
           move "5:40"                        to ir-length    
           move "Vasco Rossi"                 to ir-artist    
           move "Bollicine"                   to ir-album     
           move "Rock"                        to ir-genre     
           move "Carosello"                   to ir-label     
           move 1983                          to ir-year      

           write input-rec

           close inputfile.

       DISPLAY-INPUT-FILE.
           display " "
           display "List of the data before the sort..."
           open input inputfile

           perform DISPLAY-DATA-HEADER

           perform varying idx from 1 by 1 until idx > 20
              read inputfile next
                 at end
                    exit perform
              end-read
              perform DISPLAY-INPUT-RECORD
           end-perform.

           close inputfile
           .

       DISPLAY-INPUT-RECORD.
           move ir-artist to ds-artist 
           move ir-year   to ds-year   
           move ir-album  to ds-album  
           move ir-title  to ds-title  
           move ir-length to ds-length 

           display display-data.

       