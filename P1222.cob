       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P1222.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  ACP-DOL        PIC 9(5).
       01  INT-CNT        PIC 999.
       01  AA             PIC X.
       01  VALUE-TAB      PIC X(28)   VALUE
              "1000050001000050001000050001".
       01  TABLE-REC   REDEFINES   VALUE-TAB.
           03 CODE-TABLE  PIC 9(4) OCCURS   7  TIMES
              INDEXED  BY T-IX.
       01  SCREEN-REC.
           03 NUM-DOL     PIC Z(4).
           03 FFLLER      PIC X(6) VALUE " yuan".
           03 CNT-OUT     PIC ZZ.
           03 FILLER      PIC X(9) VALUE "  sheet".
       01  LINE-CNT       PIC 99   VALUE 8.
       PROCEDURE DIVISION.
       000-START.
           PERFORM  100-ACCPEPT-RTN
           PERFORM  UNTIL ACP-DOL  = 0
              MOVE  8  TO LINE-CNT
              PERFORM VARYING T-IX FROM  1  BY 1  UNTIL T-IX > 7
              MOVE  CODE-TABLE  (  T-IX ) TO   NUM-DOL
              COMPUTE  INT-CNT = ACP-DOL / CODE-TABLE ( T-IX )
              COMPUTE  ACP-DOL = ACP-DOL - CODE-TABLE ( T-IX )
                                   * INT-CNT
              MOVE  INT-CNT                TO CNT-OUT
              ADD   1  TO LINE-CNT
              DISPLAY  SCREEN-REC
           END-PERFORM
           DISPLAY  "CLICK   ENTER"
                                   
           ACCEPT   AA             
           PERFORM  100-ACCPEPT-RTN
           END-PERFORM
           STOP  RUN.
       100-ACCPEPT-RTN.
           DISPLAY  "  "
           DISPLAY  "  input cost  ?" 
           DISPLAY  "  end  click  O" 
           ACCEPT  ACP-DOL  
           DISPLAY  "              ".
             
