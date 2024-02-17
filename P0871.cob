       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0871.
       ENVIRONMENT  DIVISION.
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01  P     PIC  999.
       01  R     PIC  999.
       01  N50   PIC  999.
       01  N10   PIC  999.
       01  N5    PIC  999.
       01  N1    PIC  999.

       PROCEDURE DIVISION.
       000-START.
           MOVE  0  TO R  N50   N10   N5 N1
           DISPLAY  "ENTER  XX".
           ACCEPT   P
           IF P  >  100
                 DISPLAY  "INPUT   ERROR"
                 STOP  RUN
           END-IF
           COMPUTE  R = 100 -P 
           IF R  NOT < 50
                 ADD 1 TO N50
                 COMPUTE  R = R - 50
           END-IF
           PERFORM  UNTIL R  < 10
                 ADD 1 TO N10
                 COMPUTE  R = R - 10
           END-PERFORM
           IF R  NOT < 5
                 ADD   1  TO N5
                 COMPUTE  R = R - 5
           END-IF
           MOVE  R  TO N1
           DISPLAY  P
           DISPLAY  "  N50 = " N50
           DISPLAY  "  N10 = " N10
           DISPLAY  "  N5  = " N5
           DISPLAY  "  N1  = " N1
           STOP  RUN.
