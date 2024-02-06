       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0661.
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  AA          PIC  9(4)  VALUE 11.
       01  BB          PIC  9(4)  VALUE 22.
       01  CC          PIC  9(4)  VALUE 33.
       01  PP          PIC  9(7)  VALUE 0.
       PROCEDURE DIVISION .
      *000-START.
           DISPLAY "      PICTURE  PICTURE  PICTURE  PICTURE "
           DISPLAY "      9999     9999     9999     9999999 "
           DISPLAY "-----------------------------------------"
           DISPLAY "INITIAL  VALUE"
           DISPLAY "   AA = " AA
           DISPLAY "            BB = "BB
           DISPLAY "                     CC = " CC
           DISPLAY "                              PP = " PP
           DISPLAY "-----------------------------------------"
                 MULTIPLY BB BY BB GIVING   PP
                 DIVIDE   7  INTO  PP
                 MULTIPLY 3  BY CC
                 ADD   AA TO PP 
                 SUBTRACT CC FROM  PP
           DISPLAY "MULTIPY  BB BY BB GIVING   PP "
           DISPLAY "DIVIDE   7  INTO  PP"
           DISPLAY "MULTIPY  AA BY PP "
           DISPLAY "MULTIPY  3  BY CC "
           DISPLAY "ADD   AA TO PP "
           DISPLAY "SUBTRACT CC FROM  PP "
           DISPLAY "                              PP = " PP
           DISPLAY "-----------------------------------------"
              MOVE  33    TO CC
              COMPUTE  PP =  AA + BB  ** 2 / 7 * AA - CC * 3
           DISPLAY "COMPUTE  PP =  AA + BB ** 2 / 7 * AA-CC * 3"
           DISPLAY "                              PP = " PP
           DISPLAY "-----------------------------------------"
           STOP RUN.
