       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. temperature.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  F     PIC   999.
       01  C     PIC   999.
       PROCEDURE DIVISION .
           DISPLAY " temperature (Celsius) = " WITH NO ADVANCING 
           ACCEPT   C.
           COMPUTE F = ( 9 / 5 ) * C + 32.
           DISPLAY "temperature (Fahrenheit) = " F.
           STOP  RUN.
