       IDENTIFICATION  DIVISION. 
       PROGRAM-ID.  P0733.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT   BASFL ASSIGN   TO "D0733.DAT"
           ORGANIZATION   LINE  SEQUENTIAL.
           SELECT   PRTFL ASSIGN   TO PRINT "PRINTER11".
       DATA   DIVISION. 
       FILE SECTION. 
       FD  BASFL
           LABEL RECORD   IS STANDARD
           DATA  RECORD   IS BAS-REC.
       01  BAS-REC.
           03 BAS-NO         PIC X(4).
           03 BAS-NAME       PIC X(9).
           03 BAS-B1         PIC 99.
           03 BAS-B2         PIC 99.
           03 BAS-B3         PIC 99.
           03 BAS-HM         PIC 99.
           03 BAS-AB         PIC 999.
       FD  PRTFL 
           LABEL RECORD   IS OMITTED
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC           PIC X(90).
       WORKING-STORAGE SECTION. 
       01  ET-2.
           03 FILLER         PIC X    VALUE X"7E".
           03 FILLER         PIC X(4) VALUE "W2Z2".
       01  ET-1.
           03 FILLER         PIC X    VALUE X"7E".
           03 FILLER         PIC X(4) VALUE "W1Z1".
       01  HD-1.
           03 FILLER         PIC X(60) VALUE
              "              << 棒球球員打擊率分析清冊 >> ".
       01  HD-2.
           03 FILLER         PIC X(16) VALUE SPACES.
           03 FILLER         PIC X(30) VALUE "一壘   二壘  三壘".
           03 FILLER         PIC X(12) VALUE SPACES.
           03 FILLER         PIC X(20) VALUE "平 均   全 壘  ".
       01  HD-3.
           03 FILLER         PIC X(20) VALUE "號碼   姓  名".
           03 FILLER         PIC X(26) VALUE "安打   安打  安打".
           03 FILLER         PIC X(22) VALUE "全壘打 打擊數".
           03 FILLER         PIC X(24) VALUE "打擊率   打擊率".
       01  HD-4.
           03 FILLER         PIC X(71) VALUE ALL  "=".
       01  DL.
           03 DL-NO          PIC X(4).
           03 FILLER         PIC X(3).
           03 DL-NAME        PIC X(9).
           03 FILLER         PIC X(4).
           03 DL-B1          PIC Z9.
           03 FILLER         PIC X(4).
           03 DL-B2          PIC Z9.
           03 FILLER         PIC X(4).
           03 DL-B3          PIC Z9.
           03 FILLER         PIC X(4).
           03 DL-HM          PIC Z9.
           03 FILLER         PIC X(5).
           03 DL-AB          PIC ZZ9.
           03 FILLER         PIC X(5).
           03 DL-B-RATE      PIC ZZ9.
           03 FILLER         PIC X(6)  VALUE " %   ".
           03 DL-HM-RATE     PIC ZZ9.
           03 FILLER         PIC XX    VALUE " %".
       01  EOF-SW            PIC X   VALUE "N".
       01  B-RATE-WK         PIC 99.
       01  H-RATE-WK         PIC 99.
       PROCEDURE DIVISION.
       000-START.
           OPEN  INPUT BASFL OUTPUT   PRTFL
      *    WRITE PRT-REC  FROM  ET-2
           WRITE PRT-REC  FROM  HD-1
      *    WRITE PRT-REC  FROM  ET-1
           WRITE PRT-REC  FROM  HD-2
           WRITE PRT-REC  FROM  HD-3
           WRITE PRT-REC  FROM  HD-4
           READ  BASFL AT END
              MOVE  "Y"   TO EOF-SW
           END-READ
           PERFORM  UNTIL EOF-SW = "Y"
              COMPUTE  B-RATE-WK ROUNDED = ( BAS-B1 + BAS-B2 + BAS-B3
                                        + BAS-HM ) / BAS-AB * 100
              COMPUTE  H-RATE-WK   ROUNDED = BAS-HM / BAS-AB * 100
              MOVE BAS-NO          TO DL-NO
              MOVE BAS-NAME        TO DL-NAME
              MOVE BAS-B1          TO DL-B1
              MOVE BAS-B2          TO DL-B2
              MOVE BAS-B3          TO DL-B3
              MOVE BAS-HM          TO DL-HM
              MOVE BAS-AB          TO DL-AB
              MOVE B-RATE-WK       TO DL-B-RATE
              MOVE H-RATE-WK       TO DL-HM-RATE
              WRITE PRT-REC  FROM  DL
              READ  BASFL AT END
                    MOVE  "Y"  TO  EOF-SW
              END-READ
           END-PERFORM
           CLOSE  BASFL PRTFL
           STOP   RUN.



