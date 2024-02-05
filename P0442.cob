       IDENTIFICATION DIVISION. 
       PROGRAM-ID. P0442.


       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.                                                    定義所屬文
                                                                        件的行為
           SELECT STUDFL  ASSIGN TO "example.DAT"                       example分
                                                                        配給STUDFL
                   ORGANIZATION LINE SEQUENTIAL.                        lineSeq.
                                                                        按行數依序讀取
           SELECT PRINTFL ASSIGN TO PRINT   "PRINTER" .                 輸出PRIN..

           
       DATA DIVISION. 
       FILE SECTION. 
       FD STUDFL
              LABEL RECORD IS STANDARD
              DATA  RECORD IS STUD-REC.
       01  STUD-REC.
           03   STUD-IDNO       PIC  X(5).
           03   STUD-CLASS.
                05  STUD-DPT    PIC  XX.
                05  STUD-YEAR   PIC  9.
           03   STUD-NAME       PIC  X(9).
           03   STUD-CHI-CRED   PIC  9.
           03   STUD-CHI-SCOR   PIC  9(3)v9.
           03   STUD-ENG-CRED   PIC  9.
           03   STUD-ENG-SCOR   PIC  9(3)v9.
           03   STUD-MATH-CRED  PIC  9.
           03   STUD-MATH-SCOR  PIC  9(3)v9.
           03   STUD-PHYS-CRED  PIC  9.
           03   STUD-PHYS-SCOR  PIC  9(3)v9.
           03   STUD-CHEM-CRED  PIC  9.
           03   STUD-CHEM-SCOR  PIC  9(3)v9.
       FD  PRINTFL
              LABEL RECORDS IS  OMITTED
              DATA  RECORD  IS  PRT-REC.
       01  PRT-REC.
           03   PRT-IDNO        PIC  X(5).
           03   FILLER          PIC  X.
           03   PRT-CLASS.
                05  PRT-DPT     PIC  XX.
                05  PRT-YEAR    PIC  9.
           03   FILLER          PIC  XX.
           03   PRT-NAME        PIC  X(9).
           03   FILLER          PIC  X(2).
           03   PRT-CHI-CRED    PIC  9.
           03   FILLER          PIC  X.
           03   PRT-CHI-SCOR    PIC  9(3)v9.
           03   FILLER          PIC  X.
           03   PRT-ENG-CRED    PIC  9.
           03   FILLER          PIC  X.
           03   PRT-ENG-SCOR    PIC  9(3)v9.
           03   FILLER          PIC  X.
           03   PRT-MATH-CRED   PIC  9.
           03   FILLER          PIC  X.
           03   PRT-MATH-SCOR   PIC  9(3)v9.
           03   FILLER          PIC  X.
           03   PRT-PHYS-CRED   PIC  9.
           03   FILLER          PIC  X.
           03   PRT-PHYS-SCOR   PIC  9(3)v9.
           03   FILLER          PIC  X.
           03   PRT-CHEM-CRED   PIC  9.
           03   FILLER          PIC  X.
           03   PRT-CHEM-SCOR   PIC  9(3)v9.
       WORKING-STORAGE SECTION. 
       01  EOF-SW               PIC  X   VALUE "N".



      *feerew
       PROCEDURE DIVISION .
      * 000-START.
           OPEN INPUT STUDFL
                OUTPUT PRINTFL 
           READ STUDFL AT END
                MOVE "Y" TO EOF-SW 
           END-READ

           PERFORM UNTIL EOF-SW = "Y"
                MOVE SPACES         TO PRT-REC 
                MOVE STUD-IDNO      TO PRT-IDNO 
                MOVE STUD-CLASS     TO PRT-CLASS
                MOVE STUD-NAME      TO PRT-NAME 
                MOVE STUD-CHI-CRED  TO PRT-CHI-CRED 
                MOVE STUD-CHI-SCOR  TO PRT-CHI-SCOR 
                MOVE STUD-ENG-CRED  TO PRT-ENG-CRED 
                MOVE STUD-ENG-SCOR  TO PRT-ENG-SCOR 
                MOVE STUD-MATH-CRED TO PRT-MATH-CRED 
                MOVE STUD-MATH-SCOR TO PRT-MATH-SCOR 
                MOVE STUD-PHYS-CRED TO PRT-PHYS-CRED 
                MOVE STUD-PHYS-SCOR TO PRT-PHYS-SCOR 
                MOVE STUD-CHEM-CRED TO PRT-CHEM-CRED 
                MOVE STUD-CHEM-SCOR TO PRT-CHEM-SCOR 
                WRITE PRT-REC 
                READ STUDFL AT END
                      MOVE  "Y" TO EOF-SW 
                END-READ
           end-perform
           CLOSE  STUDFL  PRINTFL 
           STOP RUN .
