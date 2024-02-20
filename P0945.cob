       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0945.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  CNT.
           05 A        PIC 99.
           05 B        PIC 99.
           05 S1       PIC 9(3).
           05 S2       PIC 9(3).
       01  SOL-SW      PIC X    VALUE "N".
       PROCEDURE DIVISION.
           MOVE  ZERO     TO CNT
           PERFORM  VARYING  A  FROM  1  BY 1  UNTIL A > 9
              PERFORM  VARYING  B  FROM  1  BY 1  UNTIL B > 9
                 COMPUTE  S1 = A * 100 + A * 10 + B +
                                B * 10  + B
                 COMPUTE  S2 = B * 100 + A * 10 + A
                 IF S1 = S2
                       DISPLAY  "  A = " A
                       DISPLAY  "  B = " B
                       DISPLAY  " S1 = " S1
                       DISPLAY  " S2 = " S2
                       MOVE  "Y"   TO SOL-SW
                 END-IF
              END-PERFORM
           END-PERFORM
           IF SOL-SW   NOT = "Y"
                 DISPLAY  " No solution"
           END-IF
           STOP RUN.
