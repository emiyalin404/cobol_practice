       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. tmlyear.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  TML-YEAR       PIC 9999.
       01  wk             PIC 9999.
       01  aa             PIC 9999.
       01  SK-4-SW        PIC X VALUE SPACE.
       01  SK-100-SW      PIC X VALUE SPACE.
       01  SK-400-SW      PIC X VALUE SPACE.
       01  SK-YEAR-SW     PIC X VALUE SPACE.
       01  IS-LEAP-YEAR   PIC X VALUE SPACE.
       PROCEDURE DIVISION.
       BEGIN.
           DISPLAY  "Enter  a year: ".
           ACCEPT TML-YEAR

           DIVIDE TML-YEAR   BY 4  GIVING wk REMAINDER aa 
           IF aa =  0  THEN
              MOVE "Y" TO SK-4-SW
           END-IF
           
           DIVIDE   TML-YEAR BY 100  GIVING wk REMAINDER aa 
           IF aa =  0 THEN
              MOVE "Y" TO SK-100-SW
           END-IF

           DIVIDE   TML-YEAR BY 400  GIVING wk REMAINDER aa 
           IF aa =  0  THEN
              MOVE  "Y" TO SK-400-SW
           END-IF

           EVALUATE TRUE
              WHEN  SK-4-SW  =  "Y" AND  SK-100-SW = SPACE
                 MOVE  "Y" TO IS-LEAP-YEAR
              WHEN  SK-400-SW = "Y"
                 MOVE  "Y"  TO IS-LEAP-YEAR
              WHEN  OTHER
                 MOVE  "N"   TO IS-LEAP-YEAR
           END-EVALUATE

           IF IS-LEAP-YEAR = "Y" THEN
              DISPLAY  TML-YEAR " is a leap year."
           ELSE
              DISPLAY  TML-YEAR " is not a leap year."
           END-IF

           STOP RUN.
