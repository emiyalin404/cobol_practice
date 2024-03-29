*SYMBOLS
 IDENTIFICATION                   DIVISION.
 PROGRAM-ID.                      POPD100 .
 AUTHOR.                          SYSCOM COMPUTER ENGINEER CO.
 DATE-WRITTEN.                    81/01/16 - 10:16:05.
********************************************************************
*                                                                  *
*                    Code Generated Language                       *
*                    Tandem Request Program                        *
*     This Program is Generated by  SYSCOM A.P.G. Ver 1.00         *
*                                                                  *
********************************************************************
 ENVIRONMENT                      DIVISION.
 CONFIGURATION                    SECTION.
 SOURCE-COMPUTER.                 SYSCOM.
 OBJECT-COMPUTER.                 SYSCOM.
 SPECIAL-NAMES.
      CURSOR IS CRT-CURSOR,
      CRT STATUS IS CRT-STATUS,
      SCREEN CONTROL IS SCREEN-CONTROL.
*
 DATA                             DIVISION.
 WORKING-STORAGE                  SECTION.
      COPY "CMN/LIB/NEWVAR".
 01   MSG-CKRUNS.
      05  REPLY-C             PIC 9(04) COMP.
      05  FILLER              PIC X(22).
      05  COMM-LNK-C.
      COPY "CMN/LIB/COMMLNK".
 01  WS-G.
      05  WSDATE.
          10  WSYY                PIC 9(03).
          10  WSMM                PIC 9(02).
          10  WSDD                PIC 9(02).
      05  WSDATE-R REDEFINES WSDATE PIC 9(07).
      05  WSTIME.
          10  WS-HOUR             PIC 9(02).
          10  WS-MIN              PIC 9(02).
          10  WS-SEC              PIC 9(02).
          10  WS-CC               PIC 9(02).
      05  WSTIME-R.
          10  WS-HOUR-R           PIC 9(02).
          10  FILLER              PIC X(01) VALUE ":".
          10  WS-MIN-R            PIC 9(02).
          10  FILLER              PIC X(01) VALUE ":".
          10  WS-SEC-R            PIC 9(02).
      05  X01                     PIC 9(04) COMP.
      05  X02                     PIC 9(04) COMP.
      05  W-TOP                   PIC 9(02) VALUE 01.
      05  W-BOTTOM                PIC 9(03) VALUE 051.
*B加強對銀行帳號檢核  20191030 BY RICK ----------------  *     
      05 WK-POPMVDR-33.
         10  WK-POPMVDR-33-01      PIC X(01) OCCURS  20 TIMES.
      05 WK-POPMVDR-29.
         10 WK-POPMVDR-29-01       PIC X(03).
            88 WK-POPMVDR-29-BANK-CHK           VALUE "012".
         10 WK-POPMVDR-29-02       PIC X(04).     
        
              
      05 FLAG-SW.
         10 FLAG-SW-01                PIC 9(01) VALUE 0.
           88  FLAG-SW-01-NUMERIC               VALUE 0.
           88  FLAG-SW-01-NONNUM                VALUE 1.
           88  FLAG-SW-01-ERR                   VALUE 2. 
      10 FLAG-SW-02                PIC 9(01) VALUE 0. 
           88  FLAG-SW-02-NORMAL                VALUE 0.
           88  FLAG-SW-02-BANK-CHK              VALUE 1.         
*
 01   MSG-FILE-R.
      05  WR-ADVISORY             PIC X(78).
      COPY "CMN/LIB/MSG".
      02  MSG-BUF.
          05  MSG-CA1.
              10  CA03                           PIC  9(008)       COMP.
              10  CA36                           PIC  9(003)       COMP.
              10  CA37                           PIC  9(003)       COMP.
              10  CA40                           PIC  9(007)       COMP.
*              10  CA41                           PIC  9(006)       COMP.
*              10  CA42                           PIC  9(005)       COMP.
              10  CA48                           PIC  9(007)       COMP.
          05  MSG-CA2.
              10  CA01                           PIC  X(020)           .
              10  CA02                           PIC  X(012)           .
              10  CA04                           PIC  X(010)           .
              10  CA05                           PIC  X(004)           .
              10  CA06                           PIC  X(007)           .
              10  CA07                           PIC  X(020)           .
              10  CA08                           PIC  X(001)           .
*              10  CA09                           PIC  X(003)           .
*              10  CA10                           PIC  X(020)           .
              10  CA11                           PIC  X(002)           .
              10  CA12                           PIC  X(020)           .
              10  CA13                           PIC  X(001)           .
              10  CA14                           PIC  X(001)           .
              10  CA15                           PIC  X(030)           .
              10  CA16                           PIC  X(020)           .
              10  CA17                           PIC  X(002)           .
              10  CA18                           PIC  X(010)           .
              10  CA19                           PIC  X(010)           .
              10  CA20                           PIC  X(010)           .
              10  CA21                           PIC  X(040)           .
              10  CA22                           PIC  X(040)           .
              10  CA23                           PIC  X(060)           .
              10  CA24                           PIC  X(060)           .
*             10  CA25                           PIC  X(040)           .
              10  CA26                           PIC  X(020)           .
              10  CA27                           PIC  X(020)           .
              10  CA28                           PIC  X(025)           .
              10  CA29                           PIC  X(060)           .
              10  CA30                           PIC  X(002)           .
              10  CA31                           PIC  X(020)           .
              10  CA32                           PIC  X(002)           .
              10  CA33                           PIC  X(020)           .
              10  CA34                           PIC  X(002)           .
              10  CA35                           PIC  X(020)           .
              10  CA38                           PIC  X(010)           .
              10  CA39                           PIC  X(020)           .
              10  CA43                           PIC  X(010)           .
              10  CA44                           PIC  X(001)           .
              10  CA45                           PIC  X(010)           .
              10  CA46                           PIC  X(001)           .
              10  CA47                           PIC  X(001)           .
              10  CA49                           PIC  X(001)           .
              10  CA50                           PIC  X(004)           .
              10  CA51                           PIC  X(001)           .
      02  COMM-LNK.
      COPY "CMN/LIB/COMMLNK".
*
      02  WCHK-G.
          10  WCHK-01         PIC X OCCURS  51 TIMES.
      02  WCHK-G0     REDEFINES   WCHK-G.
          10  WCHK-001        PIC X                    .
          10  WCHK-002        PIC X                    .
          10  WCHK-003        PIC X                    .
          10  WCHK-004        PIC X                    .
          10  WCHK-005        PIC X                    .
          10  WCHK-006        PIC X                    .
          10  WCHK-007        PIC X                    .
          10  WCHK-008        PIC X                    .
          10  WCHK-009        PIC X                    .
          10  WCHK-010        PIC X                    .
          10  WCHK-011        PIC X                    .
          10  WCHK-012        PIC X                    .
          10  WCHK-013        PIC X                    .
          10  WCHK-014        PIC X                    .
          10  WCHK-015        PIC X                    .
          10  WCHK-016        PIC X                    .
          10  WCHK-017        PIC X                    .
          10  WCHK-018        PIC X                    .
          10  WCHK-019        PIC X                    .
          10  WCHK-020        PIC X                    .
          10  WCHK-021        PIC X                    .
          10  WCHK-022        PIC X                    .
          10  WCHK-023        PIC X                    .
          10  WCHK-024        PIC X                    .
          10  WCHK-025        PIC X                    .
          10  WCHK-026        PIC X                    .
          10  WCHK-027        PIC X                    .
          10  WCHK-028        PIC X                    .
          10  WCHK-029        PIC X                    .
          10  WCHK-030        PIC X                    .
          10  WCHK-031        PIC X                    .
          10  WCHK-032        PIC X                    .
          10  WCHK-033        PIC X                    .
          10  WCHK-034        PIC X                    .
          10  WCHK-035        PIC X                    .
          10  WCHK-036        PIC X                    .
          10  WCHK-037        PIC X                    .
          10  WCHK-038        PIC X                    .
          10  WCHK-039        PIC X                    .
          10  WCHK-040        PIC X                    .
          10  WCHK-041        PIC X                    .
          10  WCHK-042        PIC X                    .
          10  WCHK-043        PIC X                    .
          10  WCHK-044        PIC X                    .
          10  WCHK-045        PIC X                    .
          10  WCHK-046        PIC X                    .
          10  WCHK-047        PIC X                    .
          10  WCHK-048        PIC X                    .
          10  WCHK-049        PIC X                    .
          10  WCHK-050        PIC X                    .
          10  WCHK-051        PIC X                    .
 LINKAGE  SECTION.
 01   COMM-LNK1.
      COPY "CMN/LIB/COMMLNK".
 SCREEN                                SECTION.
 01   SCRN99  ERASE EOS.
      05  SCRN-FORM.
          10  FILLER  LINE 01, COL 02      VALUE
          "POPD100".
          10  FILLER  LINE 02, COL 25      VALUE
          "廠  商  基  本  資  料  建  立".
          10  FILLER  LINE 03, COL 01      VALUE
          "────────────────────────────".
          10  FILLER  LINE 03, COL 57      VALUE
          "────────────".
          10  FILLER  LINE 04, COL 01      VALUE
          "廠 商 代 號 :".
          10  FILLER  LINE 04, COL 22      VALUE
          "Rebate廠商 :". 
          10  FILLER  LINE 04, COL 36      VALUE
          "(Y/ )".
          10  FILLER  LINE 04, COL 44      VALUE
          "區 域 別 :".
*          "採 購 員 :".
          10  FILLER  LINE 05, COL 01      VALUE
          "交  易  別  :".
          10  FILLER  LINE 05, COL 17      VALUE
          "(1.採購2.委外3.維護4.皆是)".
          10  FILLER  LINE 05, COL 44      VALUE
          "關係人否 :".
          10  FILLER  LINE 05, COL 60      VALUE
          "(Y/ )".
*          10  FILLER  LINE 06, COL 01      VALUE
*          "供 貨 分 類 :".
*          10  FILLER  LINE 06, COL 44      VALUE
*          "區 域 別 :".
          10  FILLER  LINE 06, COL 01      VALUE
          "P/O 列印別  :".
          10  FILLER  LINE 06, COL 17      VALUE
          "(1.分 S/O  9.不分 S/O )    交易狀況 :".
          10  FILLER  LINE 06, COL 57      VALUE
          "(空白:正常 D：停止交易)".
          10  FILLER  LINE 07, COL 01      VALUE
          "連  絡  人  :".
          10  FILLER  LINE 07, COL 46      VALUE
          "負責人 :".
          10  FILLER  LINE 08, COL 01      VALUE
          "歸 屬 公 司 :".
          10  FILLER  LINE 08, COL 44      VALUE
          "支票是否郵寄 :".
          10  FILLER  LINE 08, COL 60      VALUE
          "(Y/N)".
          10  FILLER  LINE 09, COL 01      VALUE
          "廠商簡稱(中):".
          10  FILLER  LINE 09, COL 27      VALUE
          "類別:".
          10  FILLER  LINE 09, COL 44      VALUE
          "廠商簡稱(英):".
          10  FILLER  LINE 10, COL 01      VALUE
          "廠商名稱(中):".
          10  FILLER  LINE 11, COL 01      VALUE
          "修改備註    :".
          10  FILLER  LINE 12, COL 01      VALUE
          "收 款 地 址 :".
          10  FILLER  LINE 13, COL 01      VALUE
          "營 業 地 址 :".
          10  FILLER  LINE 14, COL 01      VALUE
          "郵 遞 區 號 :".
          10  FILLER  LINE 14, COL 44      VALUE
          "是否刪除 :".
          10  FILLER  LINE 14, COL 60      VALUE
          "(Y/ )".
          10  FILLER  LINE 15, COL 01      VALUE
          "TEL. NO     :".
          10  FILLER  LINE 15, COL 44      VALUE
          "FAX NO   :".
          10  FILLER  LINE 16, COL 01      VALUE
          "起始往來日  :".
          10  FILLER  LINE 16, COL 44      VALUE
          "付款方式 :".
          10  FILLER  LINE 17, COL 01      VALUE
          "價 格 方 式 :".
          10  FILLER  LINE 17, COL 44      VALUE
          "月結天數 :".
          10  FILLER  LINE 17, COL 64      VALUE
          "保固天數 :".
          10  FILLER  LINE 18, COL 01      VALUE
          "統 一 編 號 :".
          10  FILLER  LINE 18, COL 44      VALUE
          "稅籍編號 :".
          10  FILLER  LINE 19, COL 01      VALUE
          "*****廠商往來銀行相關資料 *****".
          10  FILLER  LINE 19, COL 35      VALUE
          "異動日期 :".
          10  FILLER  LINE 20, COL 01      VALUE
          "銀 行 代 號 :".
          10  FILLER  LINE 20, COL 23      VALUE
          "(單位別+分支機構別+檢號) ".
          10  FILLER  LINE 20, COL 47      VALUE
          "帳號:".
          10  FILLER  LINE 21, COL 01      VALUE
          "銀 行 名 稱 :".
          10  FILLER  LINE 22, COL 01      VALUE
          "受款人(帳戶名稱):".
*          10  FILLER  LINE 17, COL 01      VALUE
*          "TELEX NO    :".
*          10  FILLER  LINE 17, COL 44      VALUE
*          "CABLE NO :".
*          10  FILLER  LINE 19, COL 01      VALUE
*          "運 輸 方 式 :".
*          10  FILLER  LINE 21, COL 28      VALUE
*          "止付累計次數  :".
*          10  FILLER  LINE 21, COL 57      VALUE
*          "每日負荷工時 :".
      05  SCRN-DATA.
          10  CA01-CMP-NAME-L                LINE 01, COL 31
          PIC X(020)               FROM   CA01.
          10  CA01-TERM-ID-L                 LINE 01, COL 68
          PIC X(012)               FROM   CA02.
          10  CA02-TODAY                     LINE 02, COL 02
          PIC 999/99/99             FROM   CA03.
          10  CA02-USER-NAME-L               LINE 02, COL 68
          PIC X(010)               FROM   CA04.
          10  CA04-POPMVDR-01                LINE 04, COL 15
          PIC X(004)               USING  CA05
                                        UPPER UNDERLINE AUTO
                                 .
          10  CA04-POPMVDR-51                LINE 04, COL 35
          PIC X(001)               USING  CA51
                                        UPPER UNDERLINE AUTO .                      
                                 
          10  CA06-POPMVDR-05                LINE 04, COL 55
          PIC X(002)               USING  CA11
                                              UNDERLINE AUTO
                                 .
          10  CA06-POPMLOC-02                LINE 04, COL 59
          PIC X(020)               FROM   CA12.
*          10  CA04-POPMVDR-02                LINE 04, COL 55
*          PIC X(002)               USING  CA06
*                                              UNDERLINE AUTO
*                                 .
*          10  CA04-POPMMEN-03                LINE 04, COL 59
*          PIC X(020)               FROM   CA07.
          10  CA05-POPMVDR-06                LINE 05, COL 15
          PIC X(001)               USING  CA08
                                              UNDERLINE AUTO
                                 .
          10  CA47-RELATION                  LINE 05, COL 55
          PIC X(001)               USING  CA47 UPPER
                                              UNDERLINE AUTO
                                 .
*          10  CA06-POPMVDR-03                LINE 06, COL 15
*          PIC X(003)               USING  CA09
*                                              UNDERLINE AUTO
*                                 .
*          10  CA06-IMSMSRT-02                LINE 06, COL 20
*          PIC X(020)               FROM   CA10.
          10  CA07-POPMVDR-37                LINE 06, COL 15
          PIC X(001)               USING  CA13
                                              UNDERLINE AUTO
                                 .
          10  CA07-POPMVDR-20                LINE 06, COL 55
          PIC X(001)               USING  CA14
                                              UNDERLINE AUTO
                                 .
          10  CA08-POPMVDR-18                LINE 07, COL 15
          PIC X(030)               USING  CA15
                                              UNDERLINE AUTO
                                 .
          10  CA08-POPMVDR-19                LINE 07, COL 55
          PIC X(020)               USING  CA16
                                              UNDERLINE AUTO
                                 .
          10  CA09-POPMVDR-38                LINE 08, COL 15
          PIC X(002)               FROM  CA17.
*                                              UNDERLINE AUTO
*                                 .
          10  CA09-POPMCMP-04                LINE 08, COL 19
          PIC X(010)               FROM   CA18.
          10  CA09-POPMVDR-MAIL-FLAG         LINE 08, COL 59
          PIC X(001)               USING  CA44
                                              UNDERLINE AUTO
                                 .
          10  CA10-POPMVDR-09                LINE 09, COL 15
          PIC X(010)               USING  CA19
                                              UNDERLINE AUTO
                                 .
          10  CA10-POPMVDR-32                LINE 09, COL 34
          PIC X(001)               USING  CA49
                                              UNDERLINE AUTO
                                 .
          10  CA10-POPMVDR-TYPE              LINE 09, COL 37
          PIC X(004)               FROM  CA50.
          10  CA10-POPMVDR-10                LINE 09, COL 58
          PIC X(010)               USING  CA20
                                              UNDERLINE AUTO
                                 .
          10  CA11-POPMVDR-07                LINE 10, COL 15
          PIC X(040)               USING  CA21
                                              UNDERLINE AUTO
                                 .
          10  CA11-POPMVDR-07-1              LINE 10, COL 56
          PIC X(010)               USING  CA43
                                              UNDERLINE AUTO
                                 .
          10  CA12-POPMVDR-08                LINE 11, COL 15
          PIC X(040)               USING  CA22
                                              UNDERLINE AUTO
                                 .
          10  CA13-POPMVDR-111               LINE 12, COL 15
          PIC X(060)               USING  CA23
                                              UNDERLINE AUTO
                                 .
          10  CA14-POPMVDR-112               LINE 13, COL 15
          PIC X(060)               USING  CA24
                                              UNDERLINE AUTO
                                 .
          10  CA45-POPMVDR-MAIL-CODE         LINE 14, COL 15
          PIC X(010)               USING  CA45
                                              UNDERLINE AUTO
                                 .
          10  CA46-POPMVDR-DELETE            LINE 14, COL 55
          PIC X(001)               USING  CA46
                                      UPPER   UNDERLINE AUTO
                                 .
          10  CA16-POPMVDR-14                LINE 15, COL 15
          PIC X(020)               USING  CA26
                                              UNDERLINE AUTO
                                 .
          10  CA16-POPMVDR-15                LINE 15, COL 55
          PIC X(020)               USING  CA27
                                              UNDERLINE AUTO
                                 .
          10  CA21-POPMVDR-21                LINE 16, COL 15
          PIC ZZZZZZZ              USING  CA40
                                              UNDERLINE AUTO
                                 .
          10  CA18-POPMVDR-25                LINE 16, COL 55
          PIC X(002)               USING  CA32
                                              UNDERLINE AUTO
                                 .
          10  CA18-POPMPAY-02                LINE 16, COL 59
          PIC X(020)               FROM   CA33.
          10  CA19-POPMVDR-26                LINE 17, COL 15
          PIC X(002)               USING  CA34
                                              UNDERLINE AUTO
                                 .
          10  CA19-POPMPRI-02                LINE 17, COL 19
          PIC X(020)               FROM   CA35.
          10  CA19-POPMVDR-27                LINE 17, COL 55
          PIC ZZZ                  USING  CA36
                                              UNDERLINE AUTO
                                 .
          10  CA19-POPMVDR-28                LINE 17, COL 75
          PIC ZZZ                  USING  CA37
                                              UNDERLINE AUTO
                                 .
          10  CA20-POPMVDR-12                LINE 18, COL 15
          PIC X(010)               USING  CA38
                                              UNDERLINE AUTO
                                 .
          10  CA20-POPMVDR-13                LINE 18, COL 55
          PIC X(020)               USING  CA39
                                              UNDERLINE AUTO
                                 .
          10  CA21-POPMVDR-29                LINE 20, COL 15
          PIC X(007)               USING  CA06
                                              UNDERLINE AUTO
                                 .
          10  CA21-POPMVDR-33                LINE 20, COL 55
          PIC X(020)               USING  CA07
                                              UNDERLINE AUTO
                                 .
          10  CA21-POPMVDR-36                LINE 21, COL 15
          PIC X(025)               FROM   CA28
                                              UNDERLINE AUTO
                                 .
          10  CA21-POPMVDR-39                LINE 22, COL 18
          PIC X(060)               USING  CA29
                                              UNDERLINE AUTO
                                 .
           10  CA18-POPMVDR-UPD-DATE         LINE 19, COL 46
           PIC ZZZZZZZ             USING   CA48
                                              UNDERLINE AUTO
                                 .
*           10  CA17-POPMVDR-16                LINE 17, COL 15
*          PIC X(025)               USING  CA28
*                                              UNDERLINE AUTO
*                                 .
*          10  CA17-POPMVDR-17                LINE 17, COL 55
*          PIC X(020)               USING  CA29
*                                              UNDERLINE AUTO
*                                 .
*          10  CA18-POPMVDR-24                LINE 19, COL 15
*          PIC X(002)               USING  CA30
*                                              UNDERLINE AUTO
*                                 .
*          10  CA18-POPMCAR-02                LINE 19, COL 19
*          PIC X(020)               FROM   CA31.
*          10  CA21-POPMVDR-21                LINE 21, COL 15
*          PIC ZZZZZZ               USING  CA40
*                                              UNDERLINE AUTO
*                                 .
*          10  CA21-POPMVDR-22                LINE 21, COL 44
*          PIC ZZZZZZ               USING  CA41
*                                              UNDERLINE AUTO
*                                 .
*          10  CA21-POPMVDR-23                LINE 21, COL 72
*          PIC ZZZZZ                USING  CA42
*                                              UNDERLINE AUTO
*                                 .
      05  FILLER  LINE 23, COL 02      VALUE
          "    <F1>查當筆,<F3>查次筆,<F5>清除,<F6>增加,<F7>修".
      05  FILLER  LINE 23, COL 52      VALUE
          "改,<F10>結束"                            .
*     05  FILLER  LINE 23, COL 52      VALUE
*         "改,<F9>刪除,<F10>結束"                            .
      05  D99     LINE 24, COL 02  PIC X(72)   FROM    ERR-BUF
                                 .
*
 PROCEDURE        DIVISION        USING   COMM-LNK1.
*
*DECLARATIVES.
*SCREEN-RECOVERY             SECTION.
*    USE FOR SCREEN RECOVERY.
*END DECLARATIVES.
 MAIN SECTION.
*
 0000-MAIN.
      PERFORM 0100-INIT.
      PERFORM 1000-PROC    UNTIL CMD-KEY.
 0099-MAIN.
      CANCEL ALL.
      EXIT PROGRAM.
 0100-INIT.
      MOVE SYS-DATE-L OF COMM-LNK1 TO WSDATE-R.
      ACCEPT      WSTIME  FROM    TIME
      MOVE        WS-HOUR TO      WS-HOUR-R
      MOVE        WS-MIN  TO      WS-MIN-R
      MOVE        WS-SEC  TO      WS-SEC-R.
      MOVE        COMM-LNK1       TO      COMM-LNK
*     MOVE        SPACES  TO      ERR-BUF
      DISPLAY SPACES LINE 1 COL 1 ERASE SCREEN.
       DISPLAY SCRN99.
      PERFORM 9998-CKRUN.
      PERFORM 2400-PROC
      MOVE    99          TO      EVENT.
* F1->INQUARY, F5->CLEAR, F6 -> ADD, F7 -> UPDATE, F9->DELETE
* FOR GH/SA
* F1->INQUARY, F5->CLEAR, F16 -> ADD, F10 -> UPDATE, SF12->DELETE
* PROCESS SECTION
*
 1000-PROC.
      MOVE    99      TO      EVENT
      MOVE    SPACES  TO      ERR-BUF
      PERFORM 6000-GET    UNTIL   MAINTAIN-KEY
      MOVE    "處理中   !"   TO  ERR-BUF
      DISPLAY    D99     OF      SCRN99
      MOVE    SPACES      TO      WCHK-G
      IF  CLR-KEY
          MOVE 1 TO CONTROL-VALUE
          SET GOTO-FIELD TO TRUE
          PERFORM  2400-PROC
      ELSE
      IF  NOT CMD-KEY
          MOVE     W-TOP     TO     X01
          PERFORM  4000-CHK  UNTIL  X01 > W-BOTTOM OR EOF-KEY
          IF  WCHK-G  =       SPACES
              PERFORM 1010-PROC
          ELSE
              PERFORM 6520-CRT
              PERFORM 6500-CRT.
 1010-PROC.
          PERFORM   8300-WRITE-MSG.
      PERFORM   6500-CRT.
* CLEAR ITEM
 2400-PROC.
      MOVE    LOW-VALUE
          TO  MSG-CA1
      MOVE    SPACES
          TO  MSG-CA2
      MOVE     CMP-NAME-L OF COMM-LNK1
          TO  CA01                               .
      MOVE     TERM-ID-L  OF COMM-LNK1
          TO  CA02                               .
      MOVE    WSDATE-R
          TO  CA03                               .
      MOVE     USER-NAME-L OF COMM-LNK1
          TO  CA04                               .
      MOVE    "1"
          TO  CA08                               .
      MOVE    " "
          TO  CA49                               .
      MOVE    SPACES  TO      ERR-BUF
      PERFORM     6500-CRT.
*
* CHECK SECTION
*
 4000-CHK.
      ADD     051             TO  X01. 
      IF  X01 <   W-TOP
          MOVE    W-BOTTOM        TO      X01.
      ADD     1               TO      X01.
 

 5100-ERR.
      MOVE    "ＴＭＦ錯誤"   TO  ERR-BUF.
*
* SCREEN I/O SECTION
*
 6000-GET.
      ACCEPT SCRN99 ON EXCEPTION PERFORM 6010-PROC.
      IF  EXIT-KEY
          MOVE "Y" TO EXIT-L OF COMM-LNK.
 6010-PROC.
      EVALUATE CRT-STATUS
          WHEN 01
             MOVE 01 TO EVENT
          WHEN 03
             MOVE 03 TO EVENT
          WHEN 05
             MOVE 05 TO EVENT
          WHEN 06
             MOVE 06 TO EVENT
          WHEN 07
             MOVE 07 TO EVENT
*         WHEN 09
*            MOVE 09 TO EVENT
          WHEN 10
             MOVE 10 TO EVENT
          WHEN OTHER
             MOVE 99 TO EVENT
      END-EVALUATE.
 6500-CRT.
      DISPLAY
              SCRN99.
 6520-CRT.
      IF WCHK-G NOT = SPACES
         PERFORM VARYING X01 FROM W-TOP BY 1 UNTIL
                X01 > W-BOTTOM
            IF WCHK-01(X01) = "!"
               SET GOTO-FIELD TO TRUE
               EVALUATE X01
                  WHEN 005
                       MOVE 001 TO CONTROL-VALUE
                  WHEN 006
                       MOVE 002 TO CONTROL-VALUE
                  WHEN 008
                       MOVE 003 TO CONTROL-VALUE
                  WHEN 009
                       MOVE 004 TO CONTROL-VALUE
                  WHEN 011
                       MOVE 005 TO CONTROL-VALUE
                  WHEN 013
                       MOVE 006 TO CONTROL-VALUE
                  WHEN 014
                       MOVE 007 TO CONTROL-VALUE
                  WHEN 017
                       MOVE 010 TO CONTROL-VALUE
                  WHEN 030
                       MOVE 022 TO CONTROL-VALUE
                  WHEN 032
                       MOVE 023 TO CONTROL-VALUE
                  WHEN 034
                       MOVE 024 TO CONTROL-VALUE
                  WHEN 040
                       MOVE 029 TO CONTROL-VALUE
                  WHEN 041
                       MOVE 030 TO CONTROL-VALUE
               END-EVALUATE
               ADD 1 W-BOTTOM GIVING X01
            END-IF
         END-PERFORM
      END-IF.
 8300-WRITE-MSG.
      MOVE      COMM-LNK     TO COMM-LNK1.
      CALL "POPD100S" USING MSG-G ON EXCEPTION PERFORM 9099-EXP.
      EVALUATE REPLY-CODE
        WHEN  0
              PERFORM 9001-EXP
        WHEN  997
              PERFORM 9002-EXP
        WHEN  998
              PERFORM 9003-EXP
        WHEN  999
              PERFORM 9004-EXP
      END-EVALUATE.
 9001-EXP.
      MOVE        "處理正確 !"    TO      ERR-BUF.
 9002-EXP.
 9003-EXP.
 9004-EXP.
      IF  NOT ( INQ-KEY OR READ-KEY )
          PERFORM 6520-CRT
          CONTINUE.
 9099-EXP.
      COPY "CMN/LIB/CALLERR".
      COPY "CMN/LIB/CKRUN".
