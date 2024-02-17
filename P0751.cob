       IDENTIFICATION  DIVISION.
       PROGRAM-ID.  P0751.
       ENVIRONMENT   DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   PRTFL   ASSIGN   TO PRINT  "PRINTERFILE".
       DATA   DIVISION.
       FILE   SECTION.
       FD  PRTFL
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC           PIC X(80).
       WORKING-STORAGE SECTION.

       01  ET-1.
           03 FILLER         PIC X     VALUE X"7E".
           03 FILLER         PIC X(5)  VALUE "HW1Z1".

       01  ET-2.
           03 FILLER         PIC X     VALUE X"7E".
           03 FILLER         PIC X(5)  VALUE "VW2Z2".
       01  HD-1.
           03 FILLER         PIC X(10).
           03 FILLER         PIC X(24)
              VALUE "學 生 成 績 清 冊 ".

       PROCEDURE   DIVISION.
       000-START.
           OPEN  OUTPUT   PRTFL
           WRITE PRT-REC  FROM  ET-2
           WRITE PRT-REC  FROM  HD-1
           WRITE PRT-REC  FROM  ET-1
           CLOSE PRTFL
           STOP  RUN.
