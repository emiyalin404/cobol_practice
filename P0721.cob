       IDENTIFICATION  DIVISION. 
       PROGRAM-ID. P0721.
       DATA   DIVISION. 
       WORKING-STORAGE SECTION. 
       01  HD-1.
           03 FILLER      PIC X(7)  VALUE "IMAGE  ".
           03 FILLER      PIC X(20) VALUE " -ZZ,ZZ9.99  $ZZ,ZZ9".
           03 FILLER      PIC X(20) VALUE ".99  +ZZ,ZZ9.99  $**".
           03 FILLER      PIC X(20) VALUE ",**9.99  $$$,$$9.99 ".
       01  HD-2.
           03 FILLER      PIC X(7)  VALUE "IMAGE  ".
           03 FILLER      PIC X(20) VALUE " $ZZ,ZZZ.ZZ  $**,***".
           03 FILLER      PIC X(20) VALUE ".**  ZZZ,ZZZ.ZZ  ---".
           03 FILLER      PIC X(20) VALUE "----.99  +++++++.99".
       01  HD-3.
           03 FILLER      PIC X(7)  VALUE "IMAGE  ".
           03 FILLER      PIC X(20) VALUE " +++++++.++  *******".
           03 FILLER      PIC X(20) VALUE ".**  -------.--  $$$".
           03 FILLER      PIC X(20) VALUE "$$$$.$$  Z,ZZZ,ZZZCR".
       01  DL-1.
           03 FILLER      PIC X(8).
           03 AA          PIC -ZZ,ZZ9.99.
           03 FILLER      PIC XX.
           03 BB          PIC $ZZ,ZZ9.99.
           03 FILLER      PIC XX.
           03 CC          PIC +ZZ,ZZ9.99.
           03 FILLER      PIC XX.
           03 DD          PIC $**,**9.99.
           03 FILLER      PIC XX.
           03 EE          PIC $$$,$$9.99.
       01  DL-2.
           03 FILLER      PIC X(8).
           03 FF          PIC $ZZ,ZZZ.ZZ.
           03 FILLER      PIC XX.
           03 GG          PIC $**,***.**.
           03 FILLER      PIC XX.
           03 HH          PIC ZZZ,ZZZ.ZZ.
           03 FILLER      PIC XX.
           03 II          PIC -------.99.
           03 FILLER      PIC XX.
           03 JJ          PIC +++++++.99.
       01  DL-3.
           03 FILLER      PIC X(8).
           03 KK          PIC +++++++.++.
           03 FILLER      PIC XX.
           03 LL          PIC *******.**.
           03 FILLER      PIC XX.
           03 MM          PIC -------.--.
           03 FILLER      PIC XX.
           03 NN          PIC $$$$$$$.$$.
           03 FILLER      PIC XX.
           03 OO          PIC Z,ZZZ,ZZZCR.
       01  XX             PIC -$99999.
       PROCEDURE DIVISION.
       000-START.
           MOVE  1000  TO AA BB CC DD EE FF GG HH II JJ KK LL 
           MM NN OO
           DISPLAY  "                      ***** AFTER MOVE" 
           "1000 ****"
           DISPLAY  "  "
           DISPLAY  HD-1
           DISPLAY  DL-1
           DISPLAY  "  "
           DISPLAY  HD-2
           DISPLAY  DL-2
           DISPLAY  "  "
           DISPLAY  HD-3
           DISPLAY  DL-3
           DISPLAY  "  "
           MOVE -1000  TO AA BB CC DD EE FF GG HH II JJ KK LL
           MM NN OO
           DISPLAY  "                      ***** AFTER MOVE" 
           " -1000 ****"
           DISPLAY  "  "
           DISPLAY  HD-1
           DISPLAY  DL-1
           DISPLAY  "  "
           DISPLAY  HD-2
           DISPLAY  DL-2
           DISPLAY  "  "
           DISPLAY  HD-3
           DISPLAY  DL-3
           DISPLAY  "  "
           MOVE 0  TO AA BB CC DD EE FF GG HH II JJ KK LL
           MM NN OO
           DISPLAY  "                      ***** AFTER MOVE" 
           " 0 ****"
           DISPLAY  "  "
           DISPLAY  HD-1
           DISPLAY  DL-1
           DISPLAY  "  "
           DISPLAY  HD-2
           DISPLAY  DL-2 
           DISPLAY  "  "
           DISPLAY  HD-3
           DISPLAY  DL-3
           STOP RUN.
