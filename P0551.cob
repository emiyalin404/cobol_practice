       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0551.
       ENVIRONMENT  DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT  STUDFL ASSIGN TO  "example.DAT"
                 ORGANIZATION   LINE  SEQUENTIAL.
           SELECT  PRINTFL ASSIGN TO PRINT "PRINTERO.txt".
       DATA   DIVISION.
       FILE   SECTION.
       FD  STUDFL
           DATA  RECORD   IS STUD-REC.
       01  STUD-REC.
           03 STUD-IDNO         PIC X(5).
           03 STUD-CLASS.
              05 STUD-DPT       PIC XX.
              05 STUD-YEAR      PIC 9.
           03 STUD-NAME         PIC X(9).
           03 STUD-CHI-CRED     PIC 9.
           03 STUD-CHI-SCOR     PIC 9(3)v9.
           03 STUD-ENG-CRED     PIC 9.
           03 STUD-ENG-SCOR     PIC 9(3)v9.
           03 STUD-MATH-CRED    PIC 9.
           03 STUD-MATH-SCOR    PIC 9(3)v9.
           03 STUD-PHYS-CRED    PIC 9.
           03 STUD-PHYS-SCOR    PIC 9(3)v9.
           03 STUD-CHEM-CRED    PIC 9.
           03 STUD-CHEM-SCOR    PIC 9(3)v9.
       FD  PRINTFL
           DATA  RECORD   IS PRT-REC.
       01  PRT-REC.
           03 STUD-IDNO         PIC X(5).
           03 FILLER            PIC X.
           03 STUD-CLASS.
              05 STUD-DPT       PIC XX.
              05 STUD-YEAR      PIC 9.
           03 FILLER            PIC XX.
           03 STUD-NAME         PIC X(9).
           03 FILLER            PIC X(2).
           03 STUD-CHI-CRED     PIC 9.
           03 FILLER            PIC X.
           03 STUD-CHI-SCOR     PIC 9(3)v9.
           03 FILLER            PIC X.
           03 STUD-ENG-CRED     PIC 9.
           03 FILLER            PIC X.
           03 STUD-ENG-SCOR     PIC 9(3)v9.
           03 FILLER            PIC X.
           03 STUD-MATH-CRED    PIC 9.
           03 FILLER            PIC X.
           03 STUD-MATH-SCOR    PIC 9(3)v9.
           03 FILLER            PIC X.
           03 STUD-PHYS-CRED    PIC 9.
           03 FILLER            PIC X.
           03 STUD-PHYS-SCOR    PIC 9(3)v9.
           03 FILLER            PIC X.
           03 STUD-CHEM-CRED    PIC 9.
           03 FILLER            PIC X.
           03 STUD-CHEM-SCOR    PIC 9(3)v9.
       WORKING-STORAGE SECTION.
       01  EOF-SW               PIC X VALUE "N".
       PROCEDURE DIVISION.
       000-START.
           OPEN  INPUT STUDFL
                 OUTPUT PRINTFL
           READ  STUDFL AT   END
                 MOVE  "Y"   TO EOF-SW
           END-READ
           PERFORM  UNTIL EOF-SW = "Y"
              MOVE  CORR  STUD-REC TO PRT-REC
              WRITE PRT-REC
              READ STUDFL AT END
                 MOVE  "Y"   TO EOF-SW
              END-READ
           END-PERFORM
           CLOSE STUDFL   PRINTFL
           STOP  RUN.
           
