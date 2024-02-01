       IDENTIFICATION DIVISION. 
       PROGRAM-ID. P0442.
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT STUDFL  ASSIGN TO RANDOM "example.DAT"
                   ORIGANIZATION LIKE SEQUENTIAL.
           SELECT PRINTFL ASSIGN TO PRINT   "PRINTER" .
       DATA DIVISION. 
       FILE SECTION. 
              LABEL RECORD IS STANDARD
              DATA  RECORD IS STUD-REC.
       01  STUD-REC.
           03   STUD-IDNO       PIC  X(5).
           03   STUD-CLASS.
                05  STUD-DPT    PIC  XX.
                05  STUD-YEAR   PIC  9.
           03   STUD-NAME       PIC  X(6).
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
           03   PRT-NAME        PIC  X(6).
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

       PROCEDURE DIVISION .
       
