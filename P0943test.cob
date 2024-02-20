       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0943test.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.  
           SELECT   PRINTFL   ASSIGN   TO "PRINTER943TEST".
       DATA   DIVISION. 
       FILE SECTION. 
       FD  PRINTFL
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC           PIC X(80).
       WORKING-STORAGE SECTION. 
       01  CNT-AREA.
           05 ELE-CNT        PIC 99.
           05 TIM-CNT        PIC 99.
           05 MUT-CNT        PIC 99.
       01  HD-1.
           05 FILLER         PIC X(13)   VALUE SPACES.
           05 FILLER         PIC X(19)   VALUE "九九乘法表".
       01  HD-2.
           05 FILLER         PIC X(5)    VALUE "  X |".
           05 FILLER         PIC X(19)   VALUE "  1  2  3  4".
           05 FILLER         PIC X(20)   VALUE "5  6  7  8  9".
       01  HD-3.
           05 FILLER         PIC X(5)    VALUE " ---+".
           05 FILLER         PIC X(36)   VALUE ALL "-".
       01  DL-2.
           05 FILLER         PIC XX.
           05 ELE-PL         PIC 9.
           05 FIL            PIC X(4)    VALUE " |".
           05 TAB-PL.
              10 TAB-MUT OCCURS 9  TIMES.
                 15 MUT-PL   PIC ZZ.
                 15 FIL      PIC XX.
       PROCEDURE DIVISION.
           OPEN  OUTPUT   PRINTFL
           WRITE PRT-REC  FROM  HD-1  AFTER PAGE
           WRITE PRT-REC  FROM  HD-2  AFTER 1  LINE
           WRITE PRT-REC  FROM  HD-3  AFTER 1  LINE
           PERFORM  VARYING  ELE-CNT
              FROM  1  BY 1  UNTIL ELE-CNT  >  9
              PERFORM  VARYING  TIM-CNT
                 FROM  1  BY 1  UNTIL TIM-CNT  >  9
                       COMPUTE  MUT-CNT = ELE-CNT *  TIM-CNT
                 MOVE  MUT-CNT  TO MUT-PL ( TIM-CNT )
              END-PERFORM
              MOVE  ELE-CNT  TO ELE-PL
              WRITE PRT-REC  FROM  DL-2 AFTER  1  LINE
           END-PERFORM
           CLOSE PRINTFL
           STOP  RUN.
