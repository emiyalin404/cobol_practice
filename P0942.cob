       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0942.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  C        PIC 9(5)  VALUE 0.
       01  R        PIC 9(5)  VALUE 0.
       01  F        PIC 9(5)  VALUE 0.
       01  CK-SW    PIC X     VALUE "N".
       PROCEDURE DIVISION.
       000-START.
      *    PERFORM  VARYING  C  FROM  1  BY 1
      *             UNTIL    C  >  37 OR CK-SW =  "Y"
      *             COMPUTE  F  = C * 2 + ( 37 - C ) * 4
      *             IF F = 120
      *                MOVE  "Y" TO  CK-SW
      *             END-IF
      *    END-PERFORM
      *       IF CK-SW =  "Y"
      *             COMPUTE  C = C - 1
      *             DISPLAY  "cheken count  : "  C
      *             COMPUTE  R = 37 - C
      *             DISPLAY  "rabbit count  : "  R
      *       ELSE
      *             DISPLAY  " 無    解 "
      *       END-IF
      *       STOP  RUN.
              COMPUTE  C = ( 120 - 37 * 2 ) / 2
              COMPUTE  R = 37 - C
                 DISPLAY "checken count :" R
                 DISPLAY "rabbit  count :" C
              STOP  RUN.
