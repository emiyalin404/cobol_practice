       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. ifesle.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  P           PIC  999.
       01  N           PIC  999.
       01  A           PIC  999.
       PROCEDURE DIVISION .
           DISPLAY   "ENTER VALUE".
           ACCEPT P
           IF  P  > 100
              DISPLAY  "INPUT   BIG"
           ELSE  
              DISPLAY  "INPUT   SMALL"
              END-IF.
              STOP RUN.
