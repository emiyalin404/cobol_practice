      *> Copyright (c) 2005 - 2023 Veryant. Users of isCOBOL
      *> may freely modify and redistribute this program.

       identification division.
       program-id. xml.

       environment division.
       input-output section.
       file-control.
       select xml-stream assign "FileXml.xml"
                         organization  is xml   
                         document-type is omitted
                         file status is xml-status.

       data division.
       file section.
       xd xml-stream.
       01  xml-memberlist identified by "member".
           05 xml-first-name pic x(20) identified by "first_name".
           05 xml-name       pic x(20) identified by "name".
           05 xml-age        pic x(3)  identified by "age".

       working-storage section.
       77  xml-status             pic s9(9) comp.

       procedure division.

       MAIN.
      *creates the file
           display "Creating file..."
           open output xml-stream

      *record writing
           display " "  
           display "Writing into file..."  

           move "John" to xml-first-name
           move "Do"   to xml-name
           move "58"   to xml-age
           
           write xml-memberlist

      *close file  
           display " "  
           display "Closing file..."
           close xml-stream

      *Open file
           display " "
           display "Opening file..."
           open input xml-stream

      *Read the data
           display " "
           display "Reading file..."
           read xml-stream 
           display xml-first-name
           display xml-name
           display xml-age

      *close
           display " "
           display "Closing file..."
           close xml-stream

           goback.

