       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0681.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  A           PIC 999.
       01  B           PIC 999.
       01  C           PIC 999.
       01  D           PIC 999.
       01  E           PIC 9999.
       01  F           PIC 9999.
       01  K           PIC 999.
       PROCEDURE DIVISION.
       000-START.
           DISPLAY  "Please input A ?"
           ACCEPT   A
           DISPLAY  "Please input B ?"
           ACCEPT   B
           MOVE A   TO D
           MOVE B   TO E
           MOVE 1 TO   C
           PERFORM  UNTIL C  =  0
              DIVIDE   A  BY B  GIVING   K
                       REMAINDER   C
              MOVE  B  TO A
              MOVE  C  TO B
           END-PERFORM
              DISPLAY  D
              DISPLAY  E
              MULTIPLY D  BY E 
              DISPLAY  E
              MOVE  A  TO F
              DIVIDE  F  INTO   E
           DISPLAY  "GCD = " A
           DISPLAY  "LCM = " E
           STOP  RUN.
