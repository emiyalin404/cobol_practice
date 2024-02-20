       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0944.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT   PRINTFL  ASSIGN   TO "PRINT944".
       DATA   DIVISION.
       FILE SECTION. 
       FD  PRINTFL  
           LABEL  RECORD   IS OMITTED.
       01  PRINT-REC         PIC X(80).
       WORKING-STORAGE SECTION. 
       01  CNT-AREA.
           05 DOL-CNT        PIC 999.
           05 HAL-CNT        PIC 999.
           05 DIM-CNT        PIC 999.
           05 TOT-CNT        PIC 999.
       01  HD-0.
           05 FILLER         PIC X(12).
           05 FILLER         PIC X(40) VALUE
                 "美金五元紙幣換等值價目表".
       01  HD-1.
           05 FILLER         PIC X(6).
           05 FILLER         PIC X(55) VALUE
                 "   一 元        五 角         一角".
       01  HD-2.
           05 FILLER         PIC X(6).
           05 FILLER         PIC X(36) VALUE  ALL "=".
       01  DTL.
           05 FILLER         PIC X(10).
           05 P-DOL          PIC Z9.
           05 FILLER         PIC X(11).
           05 P-HAL          PIC Z9.
           05 FILLER         PIC X(12).
           05 P-DIM          PIC Z9.
       PROCEDURE DIVISION.
       000-START.
           MOVE  ZERO  TO CNT-AREA.
           OPEN  OUTPUT   PRINTFL
           WRITE PRINT-REC   FROM  HD-0  AFTER PAGE
           WRITE PRINT-REC   FROM  HD-1  AFTER 2  LINES
           WRITE PRINT-REC   FROM  HD-2  AFTER 1  LINES
           MOVE  SPACE TO PRINT-REC
           PERFORM  VARYING  DOL-CNT  FROM  0  BY 1
                    UNTIL    DOL-CNT  >  5
               PERFORM  VARYING HAL-CNT  FROM  0  BY 1
                          UNTIL HAL-CNT  >  10
                   PERFORM  VARYING DIM-CNT  FROM  0  BY 5
                                UNTIL DIM-CNT  >  50
                       COMPUTE   TOT-CNT  = DOL-CNT * 10 +  HAL-CNT * 5
                                         + DIM-CNT
                       IF  TOT-CNT = 50
                          MOVE  DIM-CNT  TO P-DIM
                          MOVE  HAL-CNT  TO P-HAL
                          MOVE  DOL-CNT  TO P-DOL
                          WRITE PRINT-REC   FROM  DTL   AFTER 1  LINES
                       END-IF
                   END-PERFORM
               END-PERFORM
           END-PERFORM
           WRITE PRINT-REC   FROM  HD-2
           CLOSE PRINTFL
           STOP  RUN.


