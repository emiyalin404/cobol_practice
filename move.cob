       IDENTIFICATION DIVISION. 
       PROGRAM-ID. moveTo.
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  AA  PIC 9(3)v99   VALUE 345.87.
       01  BB  PIC 99v9      VALUE 82.3.
       01  B   PIC 999      VALUE 123.
       01  CC  PIC 9(4)v9(3) VALUE 1168.257.

       PROCEDURE DIVISION .
      *    MOVE AA  TO BB.
      *    MOVE BB  TO CC.
           COMPUTE AA = B.
           DISPLAY AA.
           DISPLAY BB.
           DISPLAY "--------------"
           DISPLAY CC.
           STOP RUN .
