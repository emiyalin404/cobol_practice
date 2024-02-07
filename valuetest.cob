       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. valuetest.
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
      *01  AA                PIC X(6)  VALUE ALL  "##".
      *01  BB                PIC X(12) VALUE ALL  "XYZ".
      *01  CC                PIC X(14) VALUE ALL  "XYZ".
      *01  ET-CTRL-CODE      PIC X VALUE H"7E".
       01  TIME-AREA.
           03 DATE-WK-AREA   PIC 9(6).
           03 DAY-WK-AREA    PIC 9(5).
           03 TIME-WK-AREA   PIC 9(8).

       PROCEDURE DIVISION.
      *    DISPLAY   AA.
      *    DISPLAY   BB.
      *    DISPLAY   CC.
      *    DISPLAY   ET-CTRL-CODE.
           ACCEPT   DATE-WK-AREA   FROM  DATE
           ACCEPT   DAY-WK-AREA    FROM  DAY
           ACCEPT   TIME-WK-AREA   FROM  TIME
           STOP  RUN.
