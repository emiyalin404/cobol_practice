       IDENTIFICATION DIVISION. 
       PROGRAM-ID. SumExample.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 sum-total PIC   9(4) VALUE 0.
       01 counter   PIC   9(2) VALUE 1.
       01 counter-unitl PIC 9(3) VALUE 0.
       01 counter-varying PIC 9(3) VALUE 0.
       01 counter-times PIC 9(3) VALUE 0.
       01 sum-times PIC 9(4) VALUE 0.

       PROCEDURE DIVISION .
       MAIN-LOGIC. 
           PERFORM  UNTIL counter > 10
              ADD counter  TO sum-total
              ADD 1 TO counter 
           end-perform                                                  不是必須之所以加
                                                                        上是因為清楚表示
                                                                        循環結束
           DISPLAY "---------------------------------------"
           DISPLAY "The sum of numbers from 1 to 10 is: " sum-total 
           DISPLAY "---------------------------------------"

           PERFORM VARYING counter-varying FROM 0 BY 1 UNTIL 
           counter-varying > 10
              display "counter-varying is: " counter-varying 
           end-perform

           DISPLAY "---------------------------------------"
           PERFORM UNTIL counter-unitl  > 10
              DISPLAY "counter-unitl is: " counter-unitl 
              ADD 1 TO counter-unitl 
           end-perform

           DISPLAY "---------------------------------------"
           PERFORM 10 TIMES 
              ADD 1 TO counter-times 
              DISPLAY "counter-times: " counter-times 
              ADD counter-times TO sum-times 
           end-perform.
           DISPLAY  "The sum of numbers from 1 to 10 is: "sum-times 
           STOP RUN .
