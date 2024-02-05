       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. movetest.
       ENVIRONMENT DIVISION. 
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       77  AA    PIC A(5).
       77  BB    PIC 9(5).
       77  CC    PIC X(5).
       PROCEDURE DIVISION .
           MOVE  AA TO BB.
           MOVE  AA TO CC.
           MOVE  BB TO AA.
           MOVE  BB TO CC.
           MOVE  CC TO AA.
           MOVE  CC TO BB.
               