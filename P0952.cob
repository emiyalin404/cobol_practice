       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0952.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   SCORFL   ASSIGN   TO "D0952.DAT"
              ORGANIZATION   IS   LINE   SEQUENTIAL.
           SELECT   PRINTFL  ASSIGN   TO "PRINT952".
       DATA   DIVISION.
       FILE   SECTION.
       FD  SCORFL
           LABEL  RECORD  IS STANDARD
           DATA  RECORD   IS SCOR-REC.
       01  SCOR-REC.
           03 SCOR-ID           PIC X(4).
           03 SCOR-ANS          PIC X    OCCURS   20 TIMES.
       FD  PRINTFL
           LABEL RECORD   IS STANDARD
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC              PIC X(132).
       WORKING-STORAGE SECTION.
       01  HD-1.
           05 FILLER            PIC X(20).
           05 FILLER            PIC X(35)   VALUE
                 "學生測驗成績表".
       01  HD-2.
           05 FILLER            PIC X(34).
           05 FILLER            PIC X(20)   VALUE "1  1  1  1  1  1  1".
           05 FILLER            PIC X(11)   VALUE " 1  1  1  2".
       01  HD-3.
           05 FILLER            PIC X(12) VALUE "學號   1".
           05 FILLER            PIC X(20) VALUE "2  3  4  5  6  7  8 ".
           05 FILLER            PIC X(20) VALUE " 9  0  1  2  3  4  5".
           05 FILLER            PIC X(19) VALUE "  6  7  8  9  0".
           05 FILLER            PIC X(6)    VALUE "成績".
       01  HD-4                 PIC X(73)   VALUE ALL   "-".
       01  FOOT-1.
           05 FILLER            PIC X(5).
           05 FOOT-CNT          PIC ZZ9   OCCURS 20 TIMES.
       01  FOOT-2.
           05 FILLER            PIC X(59).
           05 FILLER            PIC X(10)   VALUE "平均:".
           05 FOOT-AVG          PIC ZZ9.99.
       01  DL.
           05 DL-IDNO           PIC X(4).
           05 FILLER            PIC X(3).
           05 DL-ANS-AREA       OCCURS   20 TIMES.
              10 DL-ANS         PIC X.
              10 ERROR-ANS      PIC X.
              10 FILLER         PIC X.
           05 FILLER            PIC X(2).
           05 DL-SCOR           PIC ZZZ.
       01  TAB-RIGHT.
           05 TAB-OK            PIC X OCCURS   20 TIMES.
       01  TAB-CNT-AREA.
           05 TAB-CNT           PIC 9(3) OCCURS   20 TIMES.
       01  CNT-AREA.
           05 CLS-CNT           PIC 9(5).
           05 RIGHT-CNT         PIC 9(5).
           05 TOT-SCOR          PIC 9(5).
           05 I                 PIC 9(5).
           05 WK-AVG            PIC 9(3)V99.
           05 WK-SCOR           PIC 9(3)V9.
       01  EOF-SW               PIC X          VALUE "N".
       01  1ST-SW               PIC X          VALUE "Y".
       PROCEDURE DIVISION.
           OPEN  INPUT SCORFL   OUTPUT   PRINTFL
           MOVE  ZERO  TO TAB-CNT-AREA   CNT-AREA
           PERFORM  050-WRITE-HD
           PERFORM  040-READ-RTN
           PERFORM  UNTIL EOF-SW = "Y"
              IF 1ST-SW   =  "Y"
                 IF SCOR-ID  =  "AAAA"
                    PERFORM  VARYING  I  FROM  1  BY 1
                             UNTIL I  >  20
                       MOVE  SCOR-ANS(I) TO TAB-OK(I)DL-ANS(I)
                    END-PERFORM
                    PERFORM  030-WRITE-RTN
                    WRITE PRT-REC  FROM  HD-4 AFTER  1  LINES
                    MOVE  "N"   TO 1ST-SW
                    PERFORM  040-READ-RTN
                 ELSE
                    DISPLAY  "DATA ERROR " STOP   RUN
              ELSE
                 PERFORM  VARYING  I  FROM  1  BY 1
                    UNTIL I  >  20
                    IF SCOR-ANS(I)=TAB-OK(I)
                    ADD   1  TO RIGHT-CNT
                    ADD   1  TO TAB-CNT(I)
                    MOVE  SPACE TO ERROR-ANS(I)
                 ELSE
                    MOVE  "*"   TO ERROR-ANS(I)
                    END-IF
                    MOVE  SCOR-ANS(I) TO DL-ANS(I)
                 END-PERFORM
                 COMPUTE  WK-SCOR  =  RIGHT-CNT * 5
                 PERFORM  030-WRITE-RTN
                 ADD   1  TO CLS-CNT
                 ADD   WK-SCOR  TO TOT-SCOR
                 PERFORM  040-READ-RTN
              END-IF
           END-PERFORM
           COMPUTE  WK-AVG = TOT-SCOR / CLS-CNT
           MOVE  WK-AVG   TO FOOT-AVG
           WRITE PRT-REC  FROM  HD-4  AFTER 1  LINES
           PERFORM  VARYING  I  FROM  1  BY 1  UNTIL I > 20
              MOVE  TAB-CNT(I)  TO FOOT-CNT(I)
           END-PERFORM
           WRITE PRT-REC  FROM  FOOT-1  AFTER 1  LINES
           WRITE PRT-REC  FROM  HD-4  AFTER 1  LINES
           WRITE PRT-REC  FROM  FOOT-2  AFTER 1  LINES
           CLOSE SCORFL   PRINTFL
           STOP  RUN.
       030-WRITE-RTN.
           MOVE  SCOR-ID     TO DL-IDNO
           MOVE  WK-SCOR     TO DL-SCOR
           WRITE PRT-REC  FROM  DL  AFTER 1  LINES
           MOVE  0  TO RIGHT-CNT
           MOVE  SPACE       TO DL.
       040-READ-RTN.
           READ  SCORFL   AT END
                 MOVE  "Y"   TO EOF-SW
           END-READ.
       050-WRITE-HD.
           WRITE PRT-REC  FROM  HD-1  AFTER PAGE
           WRITE PRT-REC  FROM  HD-2  AFTER 1  LINES.
           WRITE PRT-REC  FROM  HD-3  AFTER 1  LINES.
           WRITE PRT-REC  FROM  HD-4  AFTER 1  LINES.
