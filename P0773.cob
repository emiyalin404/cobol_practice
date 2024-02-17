       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0773.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.  
           SELECT   STUDFL   ASSIGN   TO "D0441.DAT"
                    ORGANIZATION   LINE  SEQUENTIAL.
           SELECT   PRINTFL  ASSIGN   TO "PRINTER22".
       DATA   DIVISION. 
       FILE   SECTION.
       FD  STUDFL   
           LABEL RECORD   IS STANDARD
           DATA  RECORD   IS STUD-REC.
       01  STUD-REC.
           03 STUD-IDNO         PIC X(5).
           03 STUD-CLASS.
              05 STUD-DPT       PIC XX.
              05 STUD-YEAR      PIC 9.
           03 STUD-NAME         PIC X(9).
           03 STUD-CHI-CRED     PIC 9.
           03 STUD-CHI-SCOR     PIC 9(3)V9.
           03 STUD-ENG-CRED     PIC 9.
           03 STUD-ENG-SCOR     PIC 9(3)V9.
           03 STUD-MATH-CRED    PIC 9.
           03 STUD-MATH-SCOR    PIC 9(3)V9.
           03 STUD-PHYS-CRED    PIC 9.
           03 STUD-PHYS-SCOR    PIC 9(3)V9.
           03 STUD-CHEM-CRED    PIC 9.
           03 STUD-CHEM-SCOR    PIC 9(3)V9.
       FD  PRINTFL  
           LABEL RECORD   IS OMITTED
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC              PIC X(100).
       WORKING-STORAGE SECTION. 
       01  HD-0.
           03 FILLER            PIC X(25).
           03 FILLER            PIC X(25)   VALUE
                 "學 生 成 績 清 單".
      *    03 FILLER            PIC X(13).
       01  HD-1.
           03 FILLER            PIC X(10)    VALUE "日 期 : ".
           03 DATE-PL           PIC 99/99/99.
           03 FILLER            PIC X(9).
           03 FILLER            PIC X(27).
           03 FILLER            PIC X(10).
           03 FILLER            PIC X(10)    VALUE "頁次 : ".
           03 PAGE-PL           PIC ZZ9.
       
       01  HD-2.
           03 FILLER            PIC X(54)   VALUE
                 "系 級  學 號  姓 名     國 文      英 文".
           03 FILLER            PIC X(54)   VALUE
                 "  數 學     物 理    化 學    平均".
       01  HD-3                 PIC X(85)   VALUE ALL "=".
       01  DL.
           03 STUD-CLASS.
              05 STUD-DPT          PIC XX.
              05 FILLER            PIC X(2).
              05 STUD-YEAR         PIC 9.
           03 FILLER               PIC X(2).
           03 STUD-IDNO            PIC X(5).
           03 FILLER               PIC X(2).
           03 STUD-NAME            PIC X(9).
           03 FILLER               PIC X(2).
           03 STUD-CHI-CRED        PIC 9.
           03 FILLER               PIC X.
           03 STUD-CHI-SCOR        PIC ZZ9.9.
           03 FILLER               PIC X(2).
           03 STUD-ENG-CRED        PIC 9.
           03 FILLER               PIC X(2).
           03 STUD-ENG-SCOR        PIC ZZ9.9.
           03 FILLER               PIC X(2).
           03 STUD-MATH-CRED       PIC 9.
           03 FILLER               PIC X(2).
           03 STUD-MATH-SCOR       PIC ZZ9.9.
           03 FILLER               PIC X(2).
           03 STUD-PHYS-CRED       PIC 9.
           03 FILLER               PIC X(2).
           03 STUD-PHYS-SCOR       PIC ZZ9.9.
           03 FILLER               PIC X(2).
           03 STUD-CHEM-CRED       PIC 9.
           03 FILLER               PIC X(2).
           03 STUD-CHEM-SCOR       PIC ZZ9.9.
           03 FILLER               PIC X(2).
           03 DL-AVG               PIC ZZ9.9.
       01  WORK-AREA.
           03 WK-CHI-SCOR          PIC 9(3)V9.
           03 WK-ENG-SCOR          PIC 9(3)V9.
           03 WK-MATH-SCOR         PIC 9(3)V9.
           03 WK-PHYS-SCOR         PIC 9(3)V9.
           03 WK-CHEM-SCOR         PIC 9(3)V9.
           03 WK-AVG-SCOR          PIC 9(3)V9.
           03 WK-TOT-CRED          PIC 9(3).
       01  DATE-WK                 PIC 9(6).
       01  PAGE-CNT                PIC 9(3)  VALUE 0.
       01  EOF-SW                  PIC X     VALUE "N".
       01  READ-OK                 PIC X.
      *01  ET-2.
      *    03 FILLER               PIC X     VALUE X"7E".
      *    03 FILLER               PIC X(4)  VALUE "W272".
       01  ET-1.
      *    03 FILLER               PIC X     VALUE X"7E".
           03 FILLER               PIC X(4)  VALUE "W271".
       PROCEDURE DIVISION.
       000-START.
           OPEN  INPUT STUDFL
                 OUTPUT   PRINTFL
           DISPLAY  "please open printer".
           DISPLAY  "CLICK   ENTER".
           ACCEPT   READ-OK
           ACCEPT   DATE-WK  FROM  DATE
           MOVE  DATE-WK   TO DATE-PL
           ADD   1  TO PAGE-CNT
           MOVE  PAGE-CNT TO PAGE-PL
      *    WRITE PRT-REC  FROM  ET-2
           WRITE PRT-REC  FROM  HD-0
      *    WRITE PRT-REC  FROM  ET-1
           WRITE PRT-REC  FROM  HD-1 AFTER  ADVANCING 2 LINE
           WRITE PRT-REC  FROM  HD-2 AFTER  ADVANCING 2 LINE
           WRITE PRT-REC  FROM  HD-3 AFTER  ADVANCING 1 LINE
           READ  STUDFL   AT END 
                 MOVE  "Y"   TO EOF-SW 
           END-READ
           PERFORM  UNTIL EOF-SW = "Y"
              MOVE  ZEROS TO WORK-AREA
              MULTIPLY STUD-CHI-CRED  OF STUD-REC BY
                       STUD-CHI-SCOR  OF STUD-REC
                       GIVING   WK-CHI-SCOR
              MULTIPLY STUD-ENG-CRED  OF STUD-REC BY
                       STUD-ENG-SCOR  OF STUD-REC
                       GIVING   WK-ENG-SCOR
              MULTIPLY STUD-MATH-CRED OF STUD-REC BY
                       STUD-MATH-SCOR OF STUD-REC
                       GIVING   WK-MATH-SCOR
              MULTIPLY STUD-PHYS-CRED OF STUD-REC BY
                       STUD-PHYS-SCOR OF STUD-REC
                       GIVING   WK-PHYS-SCOR
              MULTIPLY STUD-CHEM-CRED OF STUD-REC BY
                       STUD-CHEM-SCOR OF STUD-REC
                       GIVING   WK-CHEM-SCOR 
              ADD STUD-CHI-CRED       OF STUD-REC
                 STUD-ENG-CRED        OF STUD-REC
                 STUD-MATH-CRED       OF STUD-REC
                 STUD-PHYS-CRED       OF STUD-REC
                 STUD-CHEM-CRED       OF STUD-REC
                 TO WK-TOT-CRED
              COMPUTE   WK-AVG-SCOR ROUNDED = ( WK-CHI-SCOR
                  + WK-ENG-SCOR + WK-MATH-SCOR + WK-PHYS-SCOR
                  + WK-CHEM-SCOR ) / WK-TOT-CRED
              MOVE   SPACES            TO PRT-REC 
              MOVE   CORR  STUD-REC    TO DL
              MOVE   WK-AVG-SCOR       TO DL-AVG 
              WRITE  PRT-REC  FROM  DL AFTER ADVANCING 1 LINE
              READ   STUDFL   AT END
                    MOVE  "Y"   TO EOF-SW
              END-READ
           END-PERFORM
           CLOSE STUDFL   PRINTFL
           STOP  RUN.

