       IDENTIFICATION DIVISION.
       PROGRAM-ID. DORMANT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 N           PIC 9(3).
       01 I           PIC 9(3).
       01 THRESHOLD   PIC 9(3).
       01 COUNT-FLAG  PIC 9(3) VALUE 0.

       01 ACCOUNT-TABLE.
          05 ACCOUNT OCCURS 100 TIMES.
             10 ACC-ID PIC X(10).
             10 ACC-DAYS PIC 9(3).

       PROCEDURE DIVISION.

           ACCEPT N

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               ACCEPT ACC-ID(I)
               ACCEPT ACC-DAYS(I)
           END-PERFORM

           ACCEPT THRESHOLD

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               IF ACC-DAYS(I) > THRESHOLD
                   DISPLAY FUNCTION TRIM(ACC-ID(I))
                   ADD 1 TO COUNT-FLAG
               END-IF
           END-PERFORM

           DISPLAY "Flagged count: " COUNT-FLAG

           STOP RUN.
