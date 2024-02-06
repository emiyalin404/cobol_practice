       IDENTIFICATION DIVISION. 
       PROGRAM-ID. P0671.
       DATA   DIVISION.
       WORKING-STORAGE SECTION. 
       01  A-REC.
           05 AA       PIC 9(3) VALUE 111.
           05          PIC XX.
           05 BB       PIC 9(3) VALUE 222.
           05          PIC XX.
           05 CC       PIC 9(3) VALUE 333.
           05          PIC XX.
           05 DD       PIC 9(3) VALUE 444.
       01  B-REC.
           05 AA       PIC 9(3) VALUE 111.
           05          PIC XX.
           05 BB       PIC 9(3) VALUE 222.
           05          PIC XX.
           05 CC       PIC 9(3) VALUE 333.
           05          PIC XX.
           05 DD       PIC 9(3) VALUE 444.
       01  C-REC.
           05 AA       PIC 9(3) VALUE 0.
           05          PIC XX.
           05 BB       PIC 9(3) VALUE 0.
           05          PIC XX.
           05 CC       PIC 9(3) VALUE 0.
           05          PIC XX.
           05 DD       PIC 9(3) VALUE 0.
       PROCEDURE DIVISION.
       000-START.
           DISPLAY  "A-REC= " A-REC.
           DISPLAY  "B-REC= " B-REC.
           DISPLAY  "C-REC= " C-REC.

              ADD   CORRESPONDING  B-REC TO C-REC
              ADD   CORRESPONDING  B-REC TO C-REC
           DISPLAY  "-----------------------------"
           DISPLAY  "A-REC= " A-REC.
           DISPLAY  "B-REC= " B-REC.
           DISPLAY  "C-REC= " C-REC.
              SUBTRACT CORRESPONDING  B-REC FROM  C-REC
           DISPLAY  "-----------------------------"
           DISPLAY  "A-REC= " A-REC.
           DISPLAY  "B-REC= " B-REC.
           DISPLAY  "C-REC= " C-REC.
           STOP  RUN.
