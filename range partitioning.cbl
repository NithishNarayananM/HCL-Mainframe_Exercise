       IDENTIFICATION DIVISION.
       PROGRAM-ID. DEPOSIT-TEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 AMOUNT PIC S9(7)V99.

       PROCEDURE DIVISION.

           DISPLAY "ENTER DEPOSIT AMOUNT: "
           ACCEPT AMOUNT

           IF AMOUNT >= 1.00
               AND AMOUNT <= 500000.00

               DISPLAY "VALID"

           ELSE

               DISPLAY "INVALID"

           END-IF

           STOP RUN.
