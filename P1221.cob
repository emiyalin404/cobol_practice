       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P1211.
       DATA   DIVISION.
       WORKING-STORAGE SECTION. 
       01  VALUE-TAB         PIC X(28)   VALUE
                 "1111222233334444555566667777".
       01  TAB-REC  REDEFINES   VALUE-TAB.
              03 CODE-TABLE     PIC 9(4) OCCURS   7  TIMES
                 INDEXED  BY T-IX.
       PROCEDURE DIVISION.
       000-START.
      *    DISPLAY  "  "
           SET   T-IX  TO 3
           DISPLAY  " SET T-TIX TO 3        : " CODE-TABLE ( T-IX )
           SET   T-IX  DOWN  BY 2
           DISPLAY  " SET T-IX  DOWN  BY 2  : " CODE-TABLE ( T-IX )
           SET   T-IX  UP    BY 3
           DISPLAY  " SET T-IX  UP    BY 3  : " CODE-TABLE ( T-IX )
           DISPLAY  " DISPLAY ( TIX   + 1 ) : "
                                               CODE-TABLE ( T-IX + 1)
           STOP  RUN.
