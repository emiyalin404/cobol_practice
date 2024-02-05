       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0611.
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. IBM-PC.
       OBJECT-COMPUTER. IBM-PC.

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  AA       PIC X(10)   VALUE "A123456789".

       PROCEDURE DIVISION .
       000-START.
           DISPLAY  "                    COLUMN   1 "
           DISPLAY  "                    1234567890 "
           DISPLAY  "-------------------------------"
           DISPLAY  "INITIAL VALUE        = " AA
              MOVE  250   TO AA
           DISPLAY  "MOVE 250    TO AA    = " AA
              MOVE  "ABCD" TO  AA
           DISPLAY  "MOVE 'ABCD' TO AA    = " AA
              MOVE  ZERO  TO AA
           DISPLAY  "MOVE ZERO   TO AA    = " AA
              MOVE  0     TO AA 
           DISPLAY  "MOVE 0  TO AA        = " AA
              MOVE  "   " TO AA
           DISPLAY  "MOVE '  ' TO  AA     = " AA
              MOVE   ALL  "X"   TO AA
           DISPLAY  "MOVE ALL 'X' TO  AA  = " AA
              MOVE  SPACE TO AA
           DISPLAY  "MOVE SPACE TO AA     = " AA
              MOVE  "SPACE"  TO AA
           DISPLAY  "MOVE 'SPACE'  TO AA  = " AA
           DISPLAY  "--------------------------------------"
           STOP  RUN.
