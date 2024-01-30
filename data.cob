       IDENTIFICATION DIVISION.                                         識別部
       PROGRAM-ID. VariableName.                                        程式名稱 必要
       AUTHOR. 無名氏.                                                  程式作者
       DATE-WRITTEN. 91/05/01.                                          程式編寫日期段
       SECURITY. any SENTENCE.                                          程式保密程度

       ENVIRONMENT DIVISION.                                            環境部

       DATA DIVISION.                                                   資料部
       WORKING-STORAGE SECTION. 
       01  MyName PIC A(3) VALUE 'xyz'.                                 A代表一個文字
                                                                        A(3)代表
                                                                        放三個文字
       01  Amount PIC $9,999V99 VALUE 1450.99.                          9代表一個數
                                                                        v小數點
                                                                        $代表錢小數點
                                                                        會消失
       01  Age PIC S9(3) VALUE 100.                                     S數字有+-號
       01  MyID PIC X(10) VALUE 'A123456789'.                           x數字跟文字混合

       PROCEDURE DIVISION.                                              處理程序部
           DISPLAY "Hello, World!".
           DISPLAY MyName.
           DISPLAY Amount.
           DISPLAY Age .
           DISPLAY MyID .
           STOP RUN.