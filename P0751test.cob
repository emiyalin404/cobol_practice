       IDENTIFICATION  DIVISION.
       PROGRAM-ID.  P0751test.
       ENVIRONMENT   DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   PRINTFL ASSIGN   TO  PRINT "PRINTTEST".
       DATA   DIVISION.
       FILE   SECTION.
       FD  PRINTFL
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC        PIC   X(80).
       WORKING-STORAGE SECTION.
       01  HD-1.
           03 FILLER      PIC   X(10).
           03 FILLER      PIC   X(24)
                   VALUE  "學生成績清冊".
       PROCEDURE DIVISION.
           OPEN  OUTPUT   PRINTFL
           WRITE PRT-REC  FROM  HD-1
           CLOSE PRINTFL
           STOP  RUN.
