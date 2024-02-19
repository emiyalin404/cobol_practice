       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0941.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  CNT.
           05 ELE-CNT        PIC 9(6) VALUE 0.
           05 SUM-CNT        PIC 9(6) VALUE 0.
       PROCEDURE DIVISION.
           PERFORM  VARYING  ELE-CNT  FROM  2  BY 2
                    UNTIL ELE-CNT  >  100
                    ADD   ELE-CNT  TO SUM-CNT
           END-PERFORM
           DISPLAY  "SUM = " SUM-CNT
           STOP  RUN.
