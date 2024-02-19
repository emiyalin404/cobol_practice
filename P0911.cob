       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0911.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  CNT.
           05 T-CNT          PIC 9(6) VALUE 0.
           05 A-CNT          PIC 9(5).
       01  WK-AREA.
           05 WK-A           PIC 9(4) OCCURS   1  TO 1000
                             DEPENDING ON T-CNT.
       PROCEDURE DIVISION.
       000-START.
           DISPLAY  "  DIMENSION = "
           ACCEPT   T-CNT
           PERFORM  VARYING  A-CNT FROM  1  BY 1 
                    UNTIL A-CNT >  T-CNT 
                    MOVE  A-CNT TO WK-A  (  A-CNT )  
           END-PERFORM
           DISPLAY  "WK=  " WK-AREA.
           STOP  RUN.
