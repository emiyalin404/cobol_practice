       IDENTIFICATION DIVISION. 
       PROGRAM-ID. nineMultiply.
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       77  da1   PIC 99.
       77  da2   PIC 99.
       77  da3   PIC 99.
       PROCEDURE DIVISION .
           PERFORM VARYING da1 FROM 1 BY 1 UNTIL da1>9
              PERFORM VARYING da2 FROM 1 BY 1 UNTIL da2 >9
                 COMPUTE da3 =da1 * da2
                 IF da2 = 9
                    DISPLAY  da2 '*' da1 '=' da3 ' '
                 ELSE 
                    DISPLAY da2 '*' da1 '=' da3 ' ' WITH NO ADVANCING
                 END-IF 
           END-PERFORM
       END-PERFORM.
