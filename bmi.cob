       IDENTIFICATION DIVISION. 
       PROGRAM-ID. BMI.
       AUTHOR. kusa.
       DATE-WRITTEN. 2024-01-31.

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 height PIC 999v9.
       01 weight PIC 999v9.
       01 BMI    PIC 999v99.
       01 your   PIC X(10).

       PROCEDURE DIVISION.
           DISPLAY "please input your name: " WITH NO ADVANCING .
           ACCEPT your.
           DISPLAY " height(cm): " WITH NO ADVANCING .
           ACCEPT height .
           DISPLAY "also input your weight(kg):" WITH NO ADVANCING.
           ACCEPT weight .
           COMPUTE height = height /100.
           COMPUTE BMI ROUNDED= weight / (height * height).
           DISPLAY your"BMI : " BMI.
           STOP RUN .
