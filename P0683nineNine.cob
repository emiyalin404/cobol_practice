       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0683.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  CNT-AREA.
           05 I           PIC 9(5)    VALUE 0.
           05 J           PIC 9(5)    VALUE 0.
           05 K           PIC 9(5)    VALUE 0.
       PROCEDURE DIVISION.
       000-START.
           MOVE  ZERO  TO CNT-AREA
           PERFORM  UNTIL I  =  9 
                 ADD   1  TO I 
                 MOVE  1  TO J
                 DISPLAY  "     " I
                 PERFORM  UNTIL J = 10  
                       COMPUTE  K  =  I * J
                       DISPLAY  I " * " J " = " K
                       ADD   1  TO J
                 END-PERFORM
           END-PERFORM
           STOP  RUN.
