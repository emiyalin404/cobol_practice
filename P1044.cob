       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P1044.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT   FILE-A   ASSIGN TO   "D1041.DAT"
                 ORGANIZATION   LINE  SEQUENTIAL.
           SELECT   FILE-B   ASSIGN TO   PRINT "PRINTER1044".
           SELECT   SORTFL   ASSIGN TO   RANDOM.
       DATA   DIVISION. 
       FILE   SECTION.
       FD  FILE-A
           LABEL RECORD   IS STANDARD
           DATA  RECORD   IS A-REC.
       01  A-REC.
           03 A-CLA             PIC X.
           03 A-NO              PIC 99.
           03 A-NAME            PIC X(6).
           03 A-CHI             PIC 999.
           03 A-ENG             PIC 999.
           03 A-MATH            PIC 999.
       FD  FILE-B
           LABEL RECORD   IS OMITTED
           DATA  RECORD   IS B-REC.
       01  B-REC.
           03 B-CLA             PIC X.
           03 FILLER            PIC XX.
           03 B-NO              PIC 99.
           03 FILLER            PIC XX.
           03 B-NAME            PIC X(9).
           03 FILLER            PIC XX.
           03 B-CHI             PIC ZZ9.
           03 FILLER            PIC X.
           03 B-ENG             PIC ZZ9.
           03 FILLER            PIC X.
           03 B-MATH            PIC ZZ9.
           03 FILLER            PIC XX.
           03 B-AVG             PIC ZZ9.
           03 FILLER            PIC XX.
           03 B-GRD             PIC Z9.
       SD  SORTFL
           DATA  RECORD   IS S-REC.
       01  S-REC.
           03 S-CLA             PIC X.
           03 S-NO              PIC 99.
           03 S-NAME            PIC X(9).
           03 S-CHI             PIC 999.
           03 S-ENG             PIC 999.
           03 S-MATH            PIC 999.
           03 S-AVG             PIC 999.
       WORKING-STORAGE SECTION. 
       01  SORT-EOF-SW          PIC X    VALUE "N".
       01  FILE-A-EOF-SW        PIC X    VALUE "N".
       01  AVG                  PIC 999  VALUE 0.
       01  1ST-SW               PIC X    VALUE "N".
       01  SV-CLA               PIC X    VALUE SPACE.
       01  CNT-GRD              PIC 99   VALUE 0.
       PROCEDURE DIVISION.
       000-START SECTION.
       050-START.
           SORT  SORTFL
                 ON ASCENDING   KEY   S-CLA
                 ON DESCENDING  KEY   S-AVG
                 INPUT PROCEDURE   100-READ-AVG
                 OUTPUT   PROCEDURE   200-WRITE-GRD
           STOP  RUN.
       100-READ-AVG SECTION.
       110-PROCESS-RTN.
           OPEN  INPUT FILE-A
           READ  FILE-A   AT END
                 MOVE  "Y"   TO FILE-A-EOF-SW
           END-READ
           PERFORM  UNTIL FILE-A-EOF-SW = "Y"
              COMPUTE  AVG = ( A-CHI + A-ENG + A-MATH ) / 3
              MOVE  AVG    TO S-AVG
              MOVE  A-CLA  TO S-CLA
              MOVE  A-NO   TO S-NO
              MOVE  A-NAME TO S-NAME
              MOVE  A-CHI  TO S-CHI
              MOVE  A-ENG  TO S-ENG
              MOVE  A-MATH TO S-MATH
              RELEASE  S-REC
              READ  FILE-A   AT END
                 MOVE  "Y"   TO FILE-A-EOF-SW
              END-READ
           END-PERFORM
           CLOSE FILE-A.
       200-WRITE-GRD   SECTION.
       210-RETURN-FILE.
           OPEN  OUTPUT   FILE-B
           RETURN   SORTFL   AT END
                    MOVE  "Y"   TO SORT-EOF-SW
           END-PERFORM
           PERFORM  UNTIL SORT-EOF-SW = "Y"
              IF 1ST-SW = "Y"
                 MOVE  S-CLA TO SV-CLA
                 MOVE  "N"   TO 1ST-SW
              ELSE
                 IF    S-CLA NOT = SV-CLA
                       MOVE  S-CLA TO SV-CLA
                       MOVE  0  TO CNT-GRD
                 END-IF
              END-IF
              ADD   1  TO CNT-GRD
              MOVE  CNT-GRD  TO B-GRD
              MOVE  S-CLA    TO B-CLA
              MOVE  S-NO     TO B-NO
              MOVE  S-NAME   TO B-NAME
              MOVE  S-CHI    TO B-CHI
              MOVE  S-ENG    TO B-ENG
              MOVE  S-MATH   TO B-MATH
              MOVE  S-AVG    TO B-AVG
              WRITE B-REC
              RETURN   SORTFL   AT END
                 MOVE  "Y"   TO SORT-EOF-SW
              END-PERFORM
           END-PERFORM
           CLOSE FILE-B.
