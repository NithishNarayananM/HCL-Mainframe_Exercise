       IDENTIFICATION DIVISION.
       PROGRAM-ID. AUDIT-TEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 BALANCE       PIC 9(7) VALUE 0.
       01 N             PIC 9(3).
       01 I             PIC 9(3).
       01 AMOUNT        PIC 9(7).
       01 MAX-RETRY     PIC 9(2).
       01 FAIL-COUNT    PIC 9(2).
       01 ATTEMPTS      PIC 9(2).
       01 PROCESSED     PIC 9(3) VALUE 0.
       01 AUDIT-COUNT   PIC 9(3) VALUE 0.
       01 STATUS-CODE   PIC X(20).

       PROCEDURE DIVISION.

           DISPLAY "ENTER INITIAL BALANCE:"
           ACCEPT BALANCE

           DISPLAY "ENTER NUMBER OF TRANSACTIONS:"
           ACCEPT N

           DISPLAY "ENTER MAXIMUM RETRIES:"
           ACCEPT MAX-RETRY

           PERFORM VARYING I FROM 1 BY 1
               UNTIL I > N

               DISPLAY "ENTER TRANSACTION AMOUNT:"
               ACCEPT AMOUNT

               DISPLAY "ENTER FAILED ATTEMPTS:"
               ACCEPT FAIL-COUNT

               MOVE "RETRY EXHAUSTED" TO STATUS-CODE

               PERFORM VARYING ATTEMPTS FROM 1 BY 1
                   UNTIL ATTEMPTS > MAX-RETRY
                   OR STATUS-CODE = "UPDATED"

                   IF ATTEMPTS > FAIL-COUNT
                       ADD AMOUNT TO BALANCE
                       MOVE "UPDATED" TO STATUS-CODE
                   END-IF

               END-PERFORM

               DISPLAY STATUS-CODE

               ADD 1 TO PROCESSED
               ADD 1 TO AUDIT-COUNT

           END-PERFORM

           DISPLAY "FINAL BALANCE: " BALANCE
           DISPLAY "PROCESSED COUNT: " PROCESSED
           DISPLAY "AUDIT COUNT: " AUDIT-COUNT

           IF PROCESSED = AUDIT-COUNT
               DISPLAY "AUDIT COMPLETE"
           ELSE
               DISPLAY "AUDIT INCOMPLETE"
           END-IF

           STOP RUN.