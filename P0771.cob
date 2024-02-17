       IDENTIFICATION  DIVISION.
       PROGRAM-ID. P0771.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT   SALFL ASSIGN TO   "D0771.DAT"
           ORGANIZATION   LINE  SEQUENTIAL.
           SELECT   PRTFL ASSIGN TO   PRINT "PRINTER123".
       DATA   DIVISION. 
       FILE SECTION. 
       FD  SALFL
           LABEL RECORD   IS STANDARD
           DATA  RECORD   IS SAL-REC.
       01  SAL-REC.
           03 SAL-DATE    PIC 9(6).
           03 SAL-BOUGHT  PIC 9(3).
           03 SAL-SOLD    PIC 9(3).
       FD  PRTFL
           LABEL RECORD   IS OMITTED
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC        PIC X(80).
       WORKING-STORAGE SECTION. 
       01  HD-1.
           05 FILLER      PIC X(58) VALUE
                 "*****     銷  售  分  析  報  表     *****".
       01  HD-2.
           05 FILLER      PIC X(23) VALUE " 日   期     購入".
           05 FILLER      PIC X(23) VALUE "  售出    退回".
           05 FILLER      PIC X(13) VALUE " 利  潤".
       01  HD-3.
           05 FILLER      PIC X(45) VALUE ALL "-".
       01  DL.    
           05 DL-DATE      PIC 99/99/99.
           05 FILLER      PIC X(4).
           05 DL-BOUGHT   PIC ZZZ9.
           05 FILLER      PIC X(4).
           05 DL-SOLD     PIC ZZZ9.
           05 FILLER      PIC X(4).
           05 DL-RETURN   PIC ZZZ9.
           05 FILLER      PIC X(4).
           05 DL-PROFIT   PIC +*****.99.
       01  TOT-1.
           05 FILLER      PIC X(13)   VALUE "總 計 : ".
           05 TOT-BOUGHT  PIC ZZZZ9.
           05 FILLER      PIC X(3).
           05 TOT-SOLD    PIC ZZZZ9.
           05 FILLER      PIC X(3).
           05 TOT-RETURN  PIC ZZZZ9.
           05 FILLER      PIC X(4).
           05 TOT-PROFIT   PIC +*****.99.
       01  CNT-AREA.
           05 RETURN-CNT     PIC 9(3).
           05 PROFIT-CNT     PIC S9(5)V9.
           05 BOUGHT-TOT-CNT PIC 9(4).
           05 SOLD-TOT-CNT   PIC 9(4).
           05 RETURN-TOT-CNT PIC 9(4).
           05 PROFIT-TOT-CNT  PIC S9(5)V9.
       01  EOF-SW            PIC X VALUE "N".
       PROCEDURE DIVISION .
       000-START.
           OPEN  INPUT SALFL   OUTPUT   PRTFL
           MOVE  ZERO  TO CNT-AREA
           WRITE PRT-REC  FROM  HD-1
           WRITE PRT-REC  FROM  HD-2
           WRITE PRT-REC  FROM  HD-3
           READ  SALFL AT END
                 MOVE  "Y"   TO EOF-SW
           END-READ
           PERFORM  UNTIL   EOF-SW   =  "Y"
              COMPUTE  RETURN-CNT = SAL-BOUGHT - SAL-SOLD
              COMPUTE  PROFIT-CNT  =  SAL-SOLD   * 5
                                   +  RETURN-CNT * 2
                                   -  SAL-BOUGHT * 3.5
              MOVE  SAL-DATE       TO DL-DATE
              MOVE  SAL-BOUGHT     TO DL-BOUGHT
              MOVE  SAL-SOLD       TO DL-SOLD
              MOVE  RETURN-CNT     TO DL-RETURN
              MOVE  PROFIT-CNT     TO DL-PROFIT
              WRITE PRT-REC        FROM  DL
              ADD   SAL-BOUGHT     TO BOUGHT-TOT-CNT
              ADD   SAL-SOLD       TO SOLD-TOT-CNT
              ADD   RETURN-CNT     TO RETURN-TOT-CNT
              ADD   PROFIT-CNT     TO PROFIT-TOT-CNT
              READ  SALFL AT END
                    MOVE  "Y"   TO EOF-SW
              END-READ
           END-PERFORM
           WRITE  PRT-REC  FROM  HD-3
           MOVE   BOUGHT-TOT-CNT TO TOT-BOUGHT
           MOVE   SOLD-TOT-CNT   TO TOT-SOLD
           MOVE   RETURN-TOT-CNT TO TOT-RETURN
           MOVE   PROFIT-TOT-CNT  TO TOT-PROFIT
           WRITE  PRT-REC  FROM  TOT-1
           CLOSE  SALFL PRTFL
           STOP   RUN.           
