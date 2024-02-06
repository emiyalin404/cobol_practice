       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0682.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  CNT-AREA.
           05 S           PIC 9(5) VALUE 0.
           05 Y           PIC 9(5) VALUE 0.
           05 A           PIC 9(5) VALUE 0.
       PROCEDURE DIVISION .
       000-START.
           MOVE  10000 TO S
           MOVE  0     TO Y
           PERFORM  UNTIL S  <  1000
                 COMPUTE  A  =  S  *  ( 1 + 0.09 )
                 COMPUTE  S  =  A  -  1000
                 ADD   1  TO Y
           END-PERFORM
           DISPLAY " ** several years after  >>> " Y " year **"
           DISPLAY " **   Remaining         = >  " S
           STOP RUN.
