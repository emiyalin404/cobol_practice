       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. compute1.
       DATA   DIVISION.
       WORKING-STORAGE SECTION. 
       01  AA PIC   9(4)     VALUE 0450.
       01  BB PIC  9999V99  VALUE   12.34.
       01  CC PIC   S9(4)V9  VALUE -521.5.
       01  DD PIC   9(5)     VALUE 04310.
       PROCEDURE DIVISION .
           ADD AA TO BB.
           DISPLAY  BB.
           STOP RUN.
       