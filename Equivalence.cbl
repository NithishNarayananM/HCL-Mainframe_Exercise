       IDENTIFICATION DIVISION.
       PROGRAM-ID. DEPOSIT-VALIDATION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-INPUT          PIC X(30).
       01  WS-INTEGER        PIC 9(9).
       01  WS-DECIMAL        PIC 99.
       01  WS-STATUS         PIC X(7).

       01  WS-DOT-POS        PIC 99 VALUE 0.
       01  WS-LENGTH         PIC 99 VALUE 0.
       01  WS-FRACTION-LEN   PIC 99 VALUE 0.

       PROCEDURE DIVISION.

           MOVE "INVALID" TO WS-STATUS

           DISPLAY "ENTER DEPOSIT AMOUNT: "
           ACCEPT WS-INPUT

           INSPECT WS-INPUT
               TALLYING WS-DOT-POS FOR CHARACTERS BEFORE INITIAL "."

           IF WS-DOT-POS = 0
               PERFORM CHECK-WHOLE-NUMBER
           ELSE
               PERFORM CHECK-DECIMAL-NUMBER
           END-IF

           DISPLAY WS-STATUS

           STOP RUN.


       CHECK-WHOLE-NUMBER.

           IF WS-INPUT IS NUMERIC
               MOVE WS-INPUT TO WS-INTEGER

               IF WS-INTEGER >= 1
                   AND WS-INTEGER <= 500000
                   MOVE "VALID" TO WS-STATUS
               END-IF
           END-IF.


       CHECK-DECIMAL-NUMBER.

           CONTINUE.

       END PROGRAM DEPOSIT-VALIDATION.
