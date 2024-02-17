       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0872.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT   INSFL   ASSIGN TO "D0872.DAT"
              ORGANIZATION   LINE  SEQUENTIAL.
           SELECT   PRTFL  ASSIGN TO   PRINT "PRINTER21".
       DATA   DIVISION. 
       FILE   SECTION. 
       FD  INSFL 
           DATA  RECORD   IS INS-REC.
       01  INS-REC.
           03 INS-CODE       PIC 9(5).
           03 INS-AGE        PIC 99.
           03 INS-SEX        PIC X.
           03 INS-M          PIC X.
           03 INS-F          PIC 9.
           03 INS-COVERAGE   PIC 9(7).
       FD  PRTFL 
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC           PIC X(80).
       WORKING-STORAGE SECTION. 
       01  HD-1.
           03 FILLER         PIC X(20)  VALUE "   <<<<<  ".
           03 FILLER         PIC X(20)  VALUE "I N S U R A N C E".
           03 FILLER         PIC X(20)  VALUE "R E P O R T".
           03 FILLER         PIC X(20)  VALUE ">>>>       ".
       01  HD-2.
           03 FILLER         PIC X(21)  VALUE "   CODE   AGE   SEX".
           03 FILLER         PIC X(19)  VALUE "WED   LOAD  COVERAG".
           03 FILLER         PIC X(20)  VALUE "E     POINT RATE  ".
           03 FILLER         PIC X(20)  VALUE "  PREMIUM         ".
       01  DL.
           03 FILLER         PIC XXX.
           03 DL-CODE        PIC X(5).
           03 FILLER         PIC X(3).
           03 DL-AGE         PIC Z9.
           03 FILLER         PIC X(4).
           03 DL-SEX         PIC X.
           03 FILLER         PIC X(4).
           03 DL-M           PIC X.
           03 FILLER         PIC X(4).
           03 DL-F           PIC X.
           03 FILLER         PIC X(3).
           03 DL-COV         PIC $$$,$$$,$$$.
           03 FILLER         PIC X(4).
           03 DL-POINT       PIC Z9.
           03 FILLER         PIC X(4).
           03 DL-RATE        PIC X(5).
           03 FILLER         PIC XXX.
           03 DL-PREMIUM     PIC $,$$$,$$$.
       01  EOF-SW            PIC X VALUE "N".
       01  POINT-CNT         PIC 99.
       01  POINT-WK          PIC 99.
       01  RATE-WK           PIC 9V99999.
       01  PREMIUM-CNT       PIC 9(6).

       PROCEDURE DIVISION .
       000-START.
           MOVE  0  TO POINT-CNT
           OPEN  INPUT INSFL OUTPUT   PRTFL
           PERFORM  020-WRITE-HD
           READ  INSFL AT END
                 MOVE  "Y"   TO EOF-SW
           END-READ
           PERFORM  UNTIL EOF-SW = "Y"
              IF INS-AGE < 20
                 ADD 2    TO POINT-CNT
             ELSE
                 IF INS-AGE < 30
                    ADD   10 TO POINT-CNT
                ELSE
                    IF INS-AGE  <  40
                       ADD   8  TO POINT-CNT
                    ELSE
                       IF INS-AGE  <  50
                          ADD   6  TO POINT-CNT
                      ELSE
                          IF INS-AGE  <  60
                             ADD   4  TO POINT-CNT
                         ELSE   
                             ADD   2  TO POINT-CNT
                         END-IF
                      END-IF
                   END-IF
                 END-IF
              END-IF
              IF INS-SEX = "M"
                 ADD   5  TO POINT-CNT
              ELSE
                 ADD   3  TO POINT-CNT
              END-IF
              IF INS-M = "Y"
                 ADD   3  TO POINT-CNT
              ELSE
                 ADD   5  TO POINT-CNT
              END-IF
              COMPUTE  POINT-WK ROUNDED = INS-F * 0.5
              IF POINT-WK > 3
                 MOVE  3  TO POINT-WK
              END-IF
              SUBTRACT POINT-WK FROM  POINT-CNT
              IF POINT-CNT   >  20
                 MOVE  "0.6 %"  TO DL-RATE
                 MOVE  0.006    TO RATE-WK
              ELSE
                 IF POINT-CNT   >  18
                    MOVE  "0.5 %"  TO DL-RATE
                    MOVE  0.005    TO RATE-WK
                 ELSE
                    IF POINT-CNT   >  15
                       MOVE  "0.45%"  TO DL-RATE
                       MOVE  0.0045   TO RATE-WK
                    ELSE
                       IF POINT-CNT   >  12
                          MOVE  "0.4%"   TO DL-RATE
                          MOVE  0.004    TO RATE-WK
                       ELSE
                          IF POINT-CNT   >  9
                             MOVE  "0.35%"  TO DL-RATE
                             MOVE  0.0035   TO RATE-WK
                          ELSE
                             IF POINT-CNT   >  6
                                MOVE  "0.3%"   TO DL-RATE
                                MOVE  0.003    TO RATE-WK
                             ELSE
                                IF POINT-CNT   >  4
                                   MOVE  "0.2%"   TO DL-RATE
                                   MOVE  0.002    TO RATE-WK
                                ELSE
                                   MOVE  "0.1%"   TO DL-RATE
                                   MOVE  0.001    TO RATE-WK
                                END-IF
                             END-IF
                          END-IF
                       END-IF
                    END-IF
                 END-IF
              END-IF

              COMPUTE   PREMIUM-CNT = INS-COVERAGE * RATE-WK
              MOVE   INS-CODE       TO DL-CODE
              MOVE   INS-AGE        TO DL-AGE
              MOVE   INS-SEX        TO DL-SEX
              MOVE   INS-M          TO DL-M
              MOVE   INS-F          TO DL-F
              MOVE   INS-COVERAGE   TO DL-COV
              MOVE   PREMIUM-CNT    TO DL-PREMIUM
              MOVE   POINT-CNT      TO DL-POINT
              WRITE  PRT-REC  FROM  DL AFTER 1  LINES
              MOVE   0  TO POINT-CNT
              READ   INSFL AT END
                 MOVE  "Y"   TO EOF-SW
              END-READ
           END-PERFORM
           CLOSE  INSFL PRTFL
           STOP   RUN.
       020-WRITE-HD.
           WRITE PRT-REC  FROM  HD-1  AFTER PAGE.
           WRITE PRT-REC  FROM  HD-2  AFTER 2  LINES.

