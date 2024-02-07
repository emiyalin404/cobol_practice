       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. divideinto.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  XX PIC 99      VALUE 06.
       01  YY PIC 9(3)V9  VALUE 028.1.
       01  ZZ PIC 9(4)V9  VALUE 5744.1.
       01  RR PIC 99V9    VALUE 00.
       PROCEDURE DIVISION .
      *    ROUNDED 四捨五入取到小數點後一位
           DIVIDE XX INTO  YY ROUNDED.
           DISPLAY  YY.
           DIVIDE 3 INTO  XX.
           DISPLAY  XX.
           DIVIDE ZZ BY 46 GIVING YY REMAINDER RR.
      *    COMPUTE  YY =  ZZ / 46.
           DISPLAY  "YY =" YY.
           DISPLAY  "RR =" RR.
           STOP  RUN.
