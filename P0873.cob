       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0873.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   EMPFL   ASSIGN   TO "D0873.DAT"
              ORGANIZATION   LINE  SEQUENTIAL.
           SELECT   PRINFL   ASSIGN   TO "PRINTER873".
       DATA   DIVISION. 
       FILE SECTION. 
       FD  EMPFL 
           DATA  RECORD   IS EMP-REC.
       01  EMP-REC.
           03 EMP-ID         PIC X(3).
           03 EMP-NAME       PIC X(9).
           03 EMP-HR         PIC 9(3).
           03 EMP-RAT        PIC 9(4).
       FD  PRINFL
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC           PIC X(100).
       WORKING-STORAGE SECTION. 
       01  HD-1              PIC X(60) VALUE
           "        <<<  員 工 薪 資 清 冊   >>>".
       01  HD-2              PIC X(60) VALUE
           "員工               **工   時**".
       01  HD-3.
           03 HD-3-1         PIC X(28) VALUE
           "代號  姓  名      數".
           03 HD-3-2         PIC X(60) VALUE
           " 費  率     薪  資     註  記".
       01  HD-4              PIC X(60) VALUE  ALL "=".
       01  DL.
           03 DL-ID          PIC X(3).
           03 FILLER         PIC X(3).
           03 DL-NAME        PIC X(9).
           03 FILLER         PIC X(5).
           03 DL-HR          PIC Z(3).
           03 FILLER         PIC X(4).
           03 DL-RAT         PIC $$$$9.
           03 FILLER         PIC X(4).
           03 DL-PAY         PIC $***,***.
           03 FILLER         PIC X(4).
           03 DL-MARK        PIC X(9).
       01  EOF-SW            PIC X  VALUE  "N".
       01  PAY-CNT           PIC 9(7).

       PROCEDURE DIVISION .
       000-START.
           OPEN  INPUT EMPFL OUTPUT   PRINFL
           WRITE PRT-REC  FROM  HD-1 AFTER  1 LINES
           WRITE PRT-REC  FROM  HD-2 AFTER  2 LINES
           WRITE PRT-REC  FROM  HD-3 AFTER  1 LINES
           WRITE PRT-REC  FROM  HD-4 AFTER  1 LINES
           READ  EMPFL AT END
                 MOVE  "Y"   TO EOF-SW
           END-READ
           PERFORM  UNTIL EOF-SW = "Y"
                 COMPUTE  PAY-CNT = EMP-HR * EMP-RAT
                 IF EMP-HR > 100
                    COMPUTE  PAY-CNT = PAY-CNT * 1.1
                    MOVE  "超 時" TO DL-MARK
                 ELSE
                    MOVE  SPACES   TO DL-MARK
                 END-IF
                 MOVE  EMP-ID      TO DL-ID
                 MOVE  EMP-NAME    TO DL-NAME
                 MOVE  EMP-HR      TO DL-HR
                 MOVE  EMP-RAT     TO DL-RAT
                 MOVE  PAY-CNT     TO DL-PAY
                 WRITE PRT-REC  FROM  DL AFTER  1 LINES
                 READ  EMPFL AT END
                       MOVE  "Y"  TO EOF-SW
                 END-READ
           END-PERFORM
           CLOSE EMPFL PRINFL
           STOP  RUN.
