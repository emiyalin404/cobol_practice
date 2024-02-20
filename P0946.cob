       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0946.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  CNT-AERA.
           05 CNT         PIC 99   VALUE 0.
           05             PIC XXXXX.
           05 BIT-3       PIC 9    VALUE 0.
           05             PIC XX.
           05 BIT-2       PIC 9    VALUE 0.
           05             PIC XX.
           05 BIT-1       PIC 9    VALUE 0.
           05             PIC XX.
           05 BIT-0       PIC 9    VALUE 0.
       PROCEDURE DIVISION.
           DISPLAY  "       B  B  B  B"
           DISPLAY  "       I  I  I  I"
           DISPLAY  "       T  T  T  T"
           DISPLAY  "       3  2  1  0"
           DISPLAY  "=================="
           PERFORM  VARYING  BIT-3 FROM  0  BY 1  UNTIL BIT-3 > 1
                PERFORM  VARYING  BIT-2 FROM  0  BY 1 UNTIL BIT-2 > 1
                PERFORM  VARYING  BIT-1 FROM  0  BY 1 UNTIL BIT-1 > 1
                PERFORM  VARYING  BIT-0 FROM  0  BY 1 UNTIL BIT-0 > 1
                DISPLAY   CNT-AERA
                ADD 1  TO CNT
                END-PERFORM
                END-PERFORM
                END-PERFORM
           END-PERFORM
           STOP  RUN.
