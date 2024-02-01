       IDENTIFICATION DIVISION. 
       PROGRAM-ID. operations.
       AUTHOR. aaaa.
       DATE-WRITTEN. 2024-01-31.

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 age PIC 9(4).
       01 result PIC 9(4).


       PROCEDURE DIVISION.
           MOVE 1450 TO age.                                            將值移動到age
           DISPLAY "age = " age.
           ADD 3 TO age .                                               加法用TO
           DISPLAY "age = " age.                                        
           SUBTRACT 11 FROM age.                                        減法用FROM
           DISPLAY "age = " age.
           MULTIPLY 2 BY age.                                           乘用BY
           DISPLAY "age = " age.
           DIVIDE 2 INTO age GIVING result.                             除法把age/2
                                                                        放進result
           DISPLAY "age = " age.
           DISPLAY "result = " result.

           STOP RUN.
