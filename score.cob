       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0684.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT   STUDFL   ASSIGN   TO "D0441.DAT"
                 ORGANIZATION   LINE  SEQUENTIAL.
           SELECT   PRINTFL  ASSIGN   TO "PRINTERSCORE".
       DATA   DIVISION. 
       FILE   SECTION. 
       FD  STUDFL
           LABEL RECORD   IS STANDARD
           DATA  RECORD   IS STUD-REC.
       01  STUD-REC.
           03 STUD-IDNO      PIC   X(5).
           03 STUD-CLASS.
              05 STUD-DPT    PIC   XX.
              05 STUD-YEAR   PIC   9.
           03 STUD-NAME      PIC   X(9).
           03 STUD-CHI-CRED  PIC   9.
           03 STUD-CHI-SCOR  PIC   9(3)V9.
           03 STUD-ENG-CRED  PIC   9.
           03 STUD-ENG-SCOR  PIC   9(3)V9.
           03 STUD-MATH-CRED PIC   9.
           03 STUD-MATH-SCOR PIC   9(3)V9.
           03 STUD-PHYS-CRED PIC   9.
           03 STUD-PHYS-SCOR PIC   9(3)V9.
           03 STUD-CHEM-CRED PIC   9.
           03 STUD-CHEM-SCOR PIC   9(3)V9.
       FD  PRINTFL
           LABEL RECORD   IS OMITTED
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC           PIC   X(80).
       WORKING-STORAGE SECTION. 
       01  DL.
           03 STUD-IDNO      PIC   X(5).
           03 FILLER         PIC   X.
           03 STUD-CLASS.
              05 STUD-DPT    PIC   XX.
              05 STUD-YEAR   PIC   9.
           03 FILLER         PIC   XX.
           03 STUD-NAME      PIC   X(9).
           03 FILLER         PIC   X(2).
           03 STUD-CHI-CRED  PIC   9.
           03 FILLER         PIC   X.
           03 STUD-CHI-SCOR  PIC   9(3)V9.
           03 FILLER         PIC   X.
           03 STUD-ENG-CRED  PIC   9.
           03 FILLER         PIC   X.
           03 STUD-ENG-SCOR  PIC   9(3)V9.
           03 FILLER         PIC   X.
           03 STUD-MATH-CRED PIC   9.
           03 FILLER         PIC   X.
           03 STUD-MATH-SCOR PIC   9(3)V9.
           03 FILLER         PIC   X.
           03 STUD-PHYS-CRED PIC   9.
           03 FILLER         PIC   X.
           03 STUD-PHYS-SCOR PIC   9(3)V9.
           03 FILLER         PIC   X.
           03 STUD-CHEM-CRED PIC   9.
           03 FILLER         PIC   X.
           03 STUD-CHEM-SCOR PIC   9(3)V9.
           03 FILLER         PIC   X(3).
           03 DL-AVG         PIC   9(3)V9.
       01  WORK-AREA.
           03 WK-CHI-SCOR    PIC   9(3)V9.
           03 WK-ENG-SCOR    PIC   9(3)V9.
           03 WK-MATH-SCOR   PIC   9(3)V9.
           03 WK-PHYS-SCOR   PIC   9(3)V9.
           03 WK-CHEM-SCOR   PIC   9(3)V9.
           03 WK-HIST-SCOR   PIC   9(3)V9.
           03 WK-AVG-SCOR    PIC   9(3)V9.
           03 WK-TOT-CRED    PIC   9(3).
       01  EOF-SW            PIC   X  VALUE "N".
       PROCEDURE DIVISION.
       000-START.
           OPEN  INPUT STUDFL
                 OUTPUT   PRINTFL
           PERFORM  020-READ-STUDFL
           PERFORM  UNTIL EOF-SW   =  "Y"
              MOVE  ZEROS TO WORK-AREA
              MULTIPLY STUD-CHI-CRED  OF STUD-REC BY
                       STUD-CHI-SCOR  OF STUD-REC
                   GIVING   WK-CHI-SCOR
              MULTIPLY  STUD-ENG-CRED  OF STUD-REC BY
                             STUD-ENG-SCOR  OF STUD-REC 
                   GIVING   WK-ENG-SCOR
              MULTIPLY  STUD-MATH-CRED OF STUD-REC BY
                             STUD-MATH-SCOR OF STUD-REC
                   GIVING   WK-MATH-SCOR
              MULTIPLY  STUD-PHYS-CRED OF STUD-REC BY
                             STUD-PHYS-SCOR OF STUD-REC
                   GIVING   WK-PHYS-SCOR
              MULTIPLY  STUD-CHEM-CRED OF STUD-REC BY
                             STUD-CHEM-SCOR OF STUD-REC
                   GIVING   WK-CHEM-SCOR
             ADD STUD-CHI-CRED  OF STUD-REC
                 STUD-ENG-CRED  OF STUD-REC
                 STUD-MATH-CRED OF STUD-REC
                 STUD-PHYS-CRED OF STUD-REC
                 STUD-CHEM-CRED OF STUD-REC
             TO  WK-TOT-CRED
             COMPUTE WK-AVG-SCOR ROUNDED=(WK-CHI-SCOR
             +WK-ENG-SCOR  +WK-MATH-SCOR +WK-PHYS-SCOR +
             WK-CHEM-SCOR ) / WK-TOT-CRED
             MOVE   SPACES         TO PRT-REC
             MOVE   CORR  STUD-REC TO DL
             MOVE   WK-AVG-SCOR    TO DL-AVG
              WRITE PRT-REC  FROM  DL BEFORE  ADVANCING 1
             PERFORM   020-READ-STUDFL 
           END-PERFORM
           CLOSE STUDFL   PRINTFL
           STOP  RUN.
       020-READ-STUDFL.
           READ  STUDFL   AT END
              MOVE  "Y"   TO EOF-SW   
           END-READ.
