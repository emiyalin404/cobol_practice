       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0874.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.     
           SELECT   STUDFL ASSIGN TO "D0441.DAT"
              ORGANIZATION   LINE  SEQUENTIAL.
           SELECT   PRINFL ASSIGN TO "PRINT0874".
       DATA   DIVISION. 
       FILE SECTION. 
       FD  STUDFL 
           DATA  RECORD   IS STUD-REC.
       01  STUD-REC.
           03 STUD-IDNO         PIC X(5).
           03 STUD-CLASS.
              05 STUD-DRT       PIC XX.
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
       FD  PRINFL
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC               PIC X(110).
       WORKING-STORAGE SECTION.
       01  HD-1.
           03 FILLER            PIC X(21).
           03 FILLER            PIC X(45)  VALUE
              "<<<   學  生  成  積  清  冊   >>>".
       01  HD-2.
           03 FILLER            PIC X(12)    VALUE "日 期: ".
           03 DATE-PL           PIC 99/99/99.
           03 FILLER            PIC X(55).
           03 FILLER            PIC X(9)    VALUE "頁次: ".
           03 PAGE-PL           PIC ZZ9.
       01  HD-3.
           03 FILLER            PIC X(30)   VALUE 
              "系級   學號    姓 名".
           03 FILLER            PIC X(36)   VALUE
              " 國 文     英 文      數 學".
           03 FILLER            PIC X(50)   VALUE
              "  物 理   化 學   平 均  備註".
       01  HD-4                 PIC X(85)   VALUE ALL "=".
       01  DL.
           03 DL-CLASS.
              05 DL-DPT         PIC XX.
              05 FILLER         PIC X(2).
              05 DL-YEAR        PIC 9.
           03 FILLER            PIC X(2).
           03 DL-IDNO           PIC X(5).
           03 FILLER            PIC X(2).
           03 DL-NAME           PIC X(9).
           03 FILLER            PIC X(2).
           03 DL-CHI-CRED       PIC 9.
           03 FILLER            PIC X.
           03 DL-CHI-SCOR       PIC ZZ9.9.
           03 FILLER            PIC X(2).
           03 DL-ENG-CRED       PIC 9.
           03 FILLER            PIC X(2).
           03 DL-ENG-SCOR       PIC ZZ9.9.
           03 FILLER            PIC X(2).
           03 DL-MATH-CRED      PIC 9.
           03 FILLER            PIC X(2).
           03 DL-MATH-SCOR      PIC ZZ9.9.
           03 FILLER            PIC X(2).
           03 DL-PHYS-CRED      PIC 9.
           03 FILLER            PIC X(2).
           03 DL-PHYS-SCOR      PIC ZZ9.9.
           03 FILLER            PIC X(2).
           03 DL-CHEM-CRED      PIC 9.
           03 FILLER            PIC X.
           03 DL-CHEM-SCOR      PIC ZZ9.9.
           03 FILLER            PIC X(2).
           03 DL-AVG            PIC ZZ9.9.
           03 FILLER            PIC X(2).
           03 DL-MARK           PIC X(6).
       01  WORK-AREA.
           03 WK-CHI-SCOR       PIC 9(3)V9.
           03 WK-ENG-SCOR       PIC 9(3)V9.
           03 WK-MATH-SCOR      PIC 9(3)V9.
           03 WK-PHYS-SCOR      PIC 9(3)V9.
           03 WK-CHEM-SCOR      PIC 9(3)V9.
           03 WK-AVG-SCOR       PIC 9(3)V9.
           03 WK-TOT-CRED       PIC 9(3)V9.
       01  DATE-WK              PIC 9(6).
       01  PAGE-CNT             PIC 9(3) VALUE 0.
       01  SV-CLASS             PIC X(3).
       01  EOF-SW               PIC X    VALUE "N".
       01  IST-SW               PIC X    VALUE "Y".
       PROCEDURE DIVISION.
       000-START.
           OPEN  INPUT STUDFL
                OUTPUT PRINFL
           ACCEPT   DATE-WK  FROM  DATE
           MOVE  DATE-Wk  TO DATE-PL
           PERFORM  020-READ-STUDFL
           PERFORM  UNTIL EOF-SW = "Y"
                IF  IST-SW = "Y"
                    MOVE  "N" TO IST-SW
                    MOVE  STUD-CLASS  TO SV-CLASS
                    PERFORM  030-PRINT-HD
                 ELSE
                    IF STUD-CLASS  NOT = SV-CLASS
                       WRITE PRT-REC  FROM  HD-4 AFTER  1 LINES
                       PERFORM  030-PRINT-HD 
                       MOVE  STUD-CLASS  TO SV-CLASS
                   END-IF
               END-IF
               MOVE  ZEROS TO WORK-AREA
                    MULTIPLY  STUD-CHI-CRED  BY STUD-CHI-SCOR
                    GIVING   WK-CHI-SCOR
               MULTIPLY STUD-ENG-CRED  BY STUD-ENG-SCOR
                    GIVING   WK-ENG-SCOR
               MULTIPLY STUD-MATH-CRED BY STUD-MATH-SCOR
                    GIVING   WK-MATH-SCOR
               MULTIPLY STUD-PHYS-CRED BY STUD-PHYS-SCOR
                    GIVING   WK-PHYS-SCOR
               MULTIPLY STUD-CHEM-CRED BY STUD-CHEM-SCOR
                    GIVING   WK-CHEM-SCOR
               ADD  STUD-CHI-CRED, STUD-ENG-CRED, STUD-MATH-CRED,
                    STUD-PHYS-CRED, STUD-CHEM-CRED,
                    TO WK-TOT-CRED
               COMPUTE  WK-AVG-SCOR ROUNDED = ( WK-CHI-SCOR +
                    WK-ENG-SCOR + WK-MATH-SCOR + WK-PHYS-SCOR +
                    WK-CHEM-SCOR ) / WK-TOT-CRED
               MOVE  SPACES            TO PRT-REC
               MOVE  STUD-IDNO         TO DL-IDNO
               MOVE  STUD-NAME         TO Dl-NAME
               MOVE  STUD-DRT          TO DL-DPT
               MOVE  STUD-YEAR         TO DL-YEAR
               MOVE  STUD-CHI-CRED     TO DL-CHI-CRED
               MOVE  STUD-CHI-SCOR     TO DL-CHI-SCOR
               MOVE  STUD-ENG-CRED     TO DL-ENG-CRED
               MOVE  STUD-ENG-SCOR     TO DL-ENG-SCOR
               MOVE  STUD-MATH-CRED    TO DL-MATH-CRED
               MOVE  STUD-MATH-SCOR    TO DL-MATH-SCOR
               MOVE  STUD-PHYS-CRED    TO DL-PHYS-CRED
               MOVE  STUD-PHYS-SCOR    TO DL-PHYS-SCOR
               MOVE  STUD-CHEM-CRED    TO DL-CHEM-CRED
               MOVE  STUD-CHEM-SCOR    TO DL-CHEM-SCOR
               MOVE  WK-AVG-SCOR       TO DL-AVG
               IF   STUD-CHI-SCOR > 100  OR STUD-ENG-SCOR > 100 OR
                    STUD-MATH-SCOR > 100 OR STUD-PHYS-SCOR > 100 OR
                    STUD-CHEM-SCOR >100
                    MOVE  "錯誤" TO  DL-MARK
               ELSE
                    IF   STUD-CHI-SCOR  NOT < 75
                         AND  STUD-ENG-SCOR   NOT < 75
                         AND  STUD-MATH-SCOR  NOT < 75
                         AND  WK-AVG-SCOR     NOT < 80
                         MOVE  "優等"  TO DL-MARK
                    ELSE
                         MOVE SPACES   TO DL-MARK
                    END-IF
               END-IF
               WRITE PRT-REC  FROM  DL  AFTER 1  LINES
               PERFORM  020-READ-STUDFL
           END-PERFORM
           WRITE PRT-REC  FROM  HD-4  AFTER 1  LINES
           CLOSE  STUDFL   PRINFL
           STOP   RUN.
       020-READ-STUDFL.
           READ  STUDFL   AT END
              MOVE  "Y"   TO EOF-SW
           END-READ.
       030-PRINT-HD.
           ADD   1  TO PAGE-CNT
           MOVE  PAGE-CNT TO PAGE-PL
           MOVE  SPACE TO PRT-REC
           WRITE PRT-REC  FROM  HD-1  AFTER PAGE
           WRITE PRT-REC  FROM  HD-2  AFTER 2  LINES
           WRITE PRT-REC  FROM  HD-3  AFTER 2  LINES
           WRITE PRT-REC  FROM  HD-4 AFTER 1  LINES.
