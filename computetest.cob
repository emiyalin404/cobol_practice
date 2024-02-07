       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. computetest.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  A  PIC   9(3)    VALUE 15.
       01  B  PIC   9(2)    VALUE 8.
       01  C  PIC   9(2)V9  VALUE 17.2.
       01  D  PIC   9(2)V9  VALUE 2.6.
       01  P  PIC   9(5)V9  VALUE 0.
       PROCEDURE DIVISION .
           MULTIPLY  B  BY B GIVING   P.
           DIVIDE 7  INTO  P.
           DISPLAY  P
           MULTIPLY  A  BY P.
           MULTIPLY  3  BY C.
           ADD A  TO P.
           SUBTRACT C  FROM  P.
      *    COMPUTE  P  =  B ** 2 / 7
      *    COMPUTE  P  =  A + B ** 2 / 7 * A - C * 3
           DISPLAY  P.
           STOP  RUN.
