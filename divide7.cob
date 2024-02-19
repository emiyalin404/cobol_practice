       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. divide7.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  NUM       PIC 999  VALUE 1.
       01  MAIN      PIC 9(3) VALUE 0.
       01  RR        PIC 9(1) VALUE 0.
       
       PROCEDURE DIVISION.
           PERFORM  UNTIL NUM > 100
              DIVIDE   NUM   BY 7  GIVING   MAIN  REMAINDER   RR
              IF RR  = 0
                 DISPLAY  NUM
              END-IF
              ADD  1   TO NUM
           END-PERFORM.
           STOP  RUN.
