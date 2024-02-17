       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. print111.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT   PRINTFL ASSIGN   TO "PRINTAA".
       DATA   DIVISION. 
       FILE SECTION. 
       FD  PRINTFL
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC        PIC   X(80).
       WORKING-STORAGE SECTION. 
       01  HD-1.
           03 FILLER      PIC   X(14) VALUE SPACES.
           03 FILLER      PIC   X(30) VALUE
                 "李  大  明  先生 ".
       01  HD-2.
           03 FILLER      PIC   X(6) VALUE SPACES.
           03 FILLER      PIC   X(38)
              VALUE "(106) 台北市大安區".
       01  HD-3.    
           03 FILLER      PIC   X(12) VALUE SPACES.
           03 FILLER      PIC   X(38) VALUE
                 "杭州南路二段 93號".
       PROCEDURE DIVISION .
           OPEN  OUTPUT   PRINTFL
       
           WRITE PRT-REC  FROM  HD-1  AFTER ADVANCING 1 LINE
           WRITE PRT-REC  FROM  HD-2  AFTER ADVANCING 2 LINE
           WRITE PRT-REC  FROM  HD-3  AFTER ADVANCING 1 LINE
           CLOSE PRINTFL
           STOP  RUN.
