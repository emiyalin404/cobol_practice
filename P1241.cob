       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P1241.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  AHP-CODE-VALUE       PIC X(26)   VALUE
                 "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
       01  AHP-CODE-TABLE       REDEFINES   AHP-CODE-VALUE.
           03 AHP-TABLE         PIC X OCCURS   26 TIMES
                 INDEXED  BY CODE-INDEX.
       01  AHP-VALUE-VALUE      PIC X(52)   VALUE
           "0102030405060708091011121314151617181920212223242526".
       01  AHP-VALUE-TABLE      REDEFINES   AHP-VALUE-VALUE.
           03 AHP-VALUE         PIC XX   OCCURS   26 TIMES
              INDEXED  BY VALUE-INDEX.
       01  INPUT-CODE           PIC X.
       PROCEDURE DIVISION.
       000-START.
           DISPLAY  "input any English letter"
           ACCEPT   INPUT-CODE
           SET   CODE-INDEX  VALUE-INDEX TO 1
           SEARCH   AHP-TABLE   VARYING  VALUE-INDEX AT END
              DISPLAY  "code name  is  not  find"
           WHEN
              AHP-TABLE ( CODE-INDEX ) = INPUT-CODE
              DISPLAY  AHP-TABLE ( CODE-INDEX )
              DISPLAY  AHP-VALUE ( VALUE-INDEX )
           END-SEARCH
           STOP  RUN.
