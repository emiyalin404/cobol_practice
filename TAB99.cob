       IDENTIFICATION DIVISION.
       PROGRAM-ID. TAB99.
       ENVIRONMENT DIVISION. 
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       77 DA1 PIC 99.
       77 DA2 PIC 99.
       77 DA3 PIC 99.
       77 DA4 PIC Z9.
       77 DA5 PIC Z9.
       77 DA6 PIC Z9.

       PROCEDURE DIVISION.
       P.  PERFORM A
           VARYING DA1 FROM 1 BY 1 UNTIL DA1 > 9
           AFTER DA2 FROM 1 BY 1 UNTIL DA2 > DA1.
           STOP RUN.
       A.  COMPUTE DA3 = DA1 * DA2.
           MOVE DA3 TO DA4.
           MOVE DA1 TO DA5.
           MOVE DA2 TO DA6.
           IF DA1 = DA2
           DISPLAY DA6 '*' DA5 '=' DA4 ' '
           ELSE
           DISPLAY DA6 '*' DA5 '='DA4 ' 'WITH NO ADVANCING
           END-IF.
