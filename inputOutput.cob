       IDENTIFICATION DIVISION.
       PROGRAM-ID. InputOutput.
       AUTHOR. YesICan.
       DATE-WRITTEN. 2021-09-18.
       
       ENVIRONMENT DIVISION. 

       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01 MyAnser PIC X(5).
       01 Age PIC 9(2). 

       PROCEDURE DIVISION.
           DISPLAY "what's your name?" WITH NO ADVANCING.               with...
                                                                        不換行讓輸入的值
                                                                        在同一行

           ACCEPT MyAnser .                                             等待接受輸入值
           DISPLAY " Hi " MyAnser .
           display "How old are you".
           ACCEPT Age .
           DISPLAY AGE " is too old".
