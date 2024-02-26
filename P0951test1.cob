       IDENTIFICATION  DIVISION. 
       PROGRAM-ID.  P0951test.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT   PRINTFL  ASSIGN   TO "PRINT951TEST1".
       DATA   DIVISION. 
       FILE SECTION. 
       FD  PRINTFL  
           LABEL RECORD   IS OMITTED.
       01  PRT-REC           PIC X(80).
       WORKING-STORAGE SECTION. 
       01  MONTH-TABLE1.
           03 MONTH-NAMES.
              05 FILLER   PIC X(9) VALUE "一  月".
              05 FILLER   PIC X(9) VALUE "二  月".
              05 FILLER   PIC X(9) VALUE "三  月".
              05 FILLER   PIC X(9) VALUE "四  月".
              05 FILLER   PIC X(9) VALUE "五  月".
              05 FILLER   PIC X(9) VALUE "六  月".
              05 FILLER   PIC X(9) VALUE "七  月".
              05 FILLER   PIC X(9) VALUE "八  月".
              05 FILLER   PIC X(9) VALUE "九  月".
              05 FILLER   PIC X(9) VALUE "十  月".
              05 FILLER   PIC X(9) VALUE "十一月".
              05 FILLER   PIC X(9) VALUE "十二月".
           03 MONTH-SUB   REDEFINES   MONTH-NAMES.
              05 MONTH OCCURS   12 TIMES    PIC X(9).
       01  HD-1.
           03 FILLER      PIC X(16).
           03 YEAR-HD1    PIC X(4).
           03 FILLER      PIC X(4).
           03 M-N         PIC X(9).
       01  HD-2.
           03 FILLER      PIC X(8).
           03 WEEK-NAME   PIC X(43)
                 VALUE "一 二 三 四 五 六 日".
       01  MONTH-TABLE.
           03 WEEKS  OCCURS   6  TIMES.
              05 FILLER   PIC X(5).
              05 T-DAY    PIC ZZZZ    OCCURS   7  TIMES.
       01  TML-YEAR       PIC 9(4).
       01  SW-AREA.
           03 SK-4-SW     PIC X.
           03 SK-100-SW   PIC X.
           03 SK-400-SW   PIC X.
           03 SK-YEAR-SW  PIC X.
       01  WEEK-P         PIC X(80).
       01  CNT-AREA.
           03 WK-YEAR     PIC 9(5).
           03 WEEK-DAY    PIC 9(5).
           03 XX          PIC 9(5).
           03 YY          PIC 9(5).
           03 ZZ          PIC 9(5).
           03 SP-YEAR     PIC 9(5).
           03 WK-DAY      PIC 9(5).
           03 BX          PIC 9(5).
           03 WK          PIC 9(5).
           03 AA          PIC 9(5).
           03 IX          PIC 9(5).
           03 WEEK-NO     PIC 9(5).
           03 DAYS        PIC 9(5).
           03 END-DAY     PIC 99.
           03 WEEK-NO1    PIC 99.
           03 MONTH-CNT   PIC 99.
           03 MONTH-NO    PIC 99.
              88 MONTH-2  VALUE 2.
              88 MONTH-30 VALUE 4 6 9 11.
              88 MONTH-31 VALUE 1 3 5 7 8 10 12.
       PROCEDURE DIVISION.
           OPEN  OUTPUT   PRINTFL.
           MOVE  ZERO  TO CNT-AREA
           MOVE  SPACE TO SW-AREA
           MOVE  SPACE TO PRT-REC
           WRITE PRT-REC  AFTER PAGE

           DISPLAY  "input year"
           ACCEPT   TML-YEAR
           MOVE     TML-YEAR TO YEAR-HD1
           COMPUTE  WK-YEAR  =  TML-YEAR - 1
           COMPUTE  XX       =  WK-YEAR  / 4
           COMPUTE  YY       =  WK-YEAR  / 100
           COMPUTE  ZZ       =  WK-YEAR  / 400
           COMPUTE  SP-YEAR  =  XX - YY  + ZZ
           COMPUTE  WK-DAY   =  WK-YEAR  * 365 +  SP-YEAR
           COMPUTE  WK       =  WK-DAY   / 7
           COMPUTE  WEEK-DAY =  WK-DAY   - WK * 7
           ADD   1  TO WEEK-DAY
           IF WEEK-DAY >  7
              MOVE  1  TO WEEK-DAY
           END-IF

           COMPUTE  WK       =  TML-YEAR / 4
           COMPUTE  AA       =  TML-YEAR - WK * 4
           IF    AA =  0
                 MOVE  "Y"   TO SK-4-SW
           END-IF
           COMPUTE  WK       =  TML-YEAR / 100
           COMPUTE  AA       =  TML-YEAR - WK  * 100
           IF    AA =  0
                 MOVE  "Y"   TO SK-100-SW
           END-IF
           COMPUTE  WK       =  TML-YEAR / 400
           COMPUTE  AA       =  TML-YEAR -  WK * 400
           IF    AA =  0
                 MOVE  "Y"   TO SK-400-SW
           END-IF
           IF SK-4-SW = "Y"
              IF SK-100-SW = "Y"
                 IF SK-400-SW = "Y"
                    MOVE  "Y" TO   SK-YEAR-SW
                 ELSE
                    MOVE  "N" TO   SK-YEAR-SW
                 END-IF
              ELSE
                 MOVE  "Y"  TO  SK-YEAR-SW
              END-IF
           ELSE
              MOVE  "N"   TO SK-YEAR-SW
           END-IF
           PERFORM  UNTIL MONTH-NO = 12
                 ADD   1  TO MONTH-NO
                 MOVE  1  TO WEEK-NO
                 MOVE  1  TO DAYS
                 MOVE  SPACE TO MONTH-TABLE
                 IF SK-YEAR-SW = "Y"
                    IF MONTH-2
                       MOVE  29 TO END-DAY
                    ELSE
                       IF MONTH-30
                          MOVE  30 TO END-DAY
                       ELSE
                          MOVE  31 TO END-DAY
                       END-IF
                     END-IF
                 ELSE
                    IF MONTH-2
                       MOVE  28 TO END-DAY
                    ELSE
                       IF MONTH-30
                          MOVE  30 TO END-DAY
                       ELSE
                          MOVE  31 TO END-DAY
                       END-IF
                    END-IF
                 END-IF
           PERFORM  UNTIL DAYS  > END-DAY
              MOVE  DAYS  TO T-DAY ( WEEK-NO , WEEK-DAY )
              ADD   1  TO DAYS
              IF WEEK-DAY <  7
                 ADD   1  TO WEEK-DAY
              ELSE
                 MOVE  1  TO WEEK-DAY
                 ADD   1  TO WEEK-NO
              END-IF
           END-PERFORM
           MOVE   MONTH ( MONTH-NO ) TO M-N
           WRITE  PRT-REC  FROM  HD-1
              AFTER ADVANCING   4  LINES
           WRITE  PRT-REC  FROM  HD-2
              AFTER ADVANCING   2  LINES
           MOVE   1  TO WEEK-NO
           PERFORM   UNTIL WEEK-NO  >  6
              MOVE   WEEKS ( WEEK-NO ) TO WEEK-P
              WRITE PRT-REC  FROM  WEEK-P
                    AFTER ADVANCING   2  LINES
              ADD   1  TO WEEK-NO
           END-PERFORM
           ADD   1  TO MONTH-CNT
           IF MONTH-CNT   NOT   <  3
              MOVE  SPACE TO PRT-REC
              WRITE PRT-REC
                 AFTER ADVANCING   PAGE
                 MOVE  0  TO MONTH-CNT
              END-IF
           END-PERFORM
           CLOSE PRINTFL
           STOP  RUN.
