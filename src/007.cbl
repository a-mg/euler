      * 007:
      *
      * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
      * we can see that the 6th prime is 13.
      *
      * What is the 10,001st prime number?

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Project-Euler-Seven.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * index (n) of nth prime we're searching for
           78 N-End     VALUE IS 10001.
      * prime search state
           01 N         USAGE IS UNSIGNED-LONG.
           01 Nth-Prime USAGE IS UNSIGNED-LONG.
       LOCAL-STORAGE SECTION.
      * parameters for prime check
           01 Candidate USAGE IS UNSIGNED-LONG.
           01 Is-Prime  PIC 9(1).
      * local variables for prime check calculations
           01 Root      USAGE IS FLOAT-LONG.
           01 I         USAGE IS UNSIGNED-LONG.
           01 Remain    USAGE IS UNSIGNED-LONG.

       PROCEDURE DIVISION.
      * initialize data values
           MOVE 2 TO N
           MOVE 3 TO Nth-Prime
           MOVE Nth-Prime TO Candidate
      * calculate primes until N = N-END
           PERFORM FIND-NEXT-PRIME UNTIL N = N-End
      * print answer and finish
           DISPLAY Nth-Prime
           STOP RUN
           .

       FIND-NEXT-PRIME.
           ADD 2 TO Candidate
           PERFORM CHECK-CANDIDATE-IS-PRIME
           IF Is-Prime = 1 THEN
      * update state of search
               ADD 1 TO N
               MOVE Candidate TO Nth-Prime
           ELSE
      * otherwise check next candidate
               PERFORM FIND-NEXT-PRIME
           END-IF
           .

       CHECK-CANDIDATE-IS-PRIME.
      * check if a candidate is prime by making sure it can't be divided
      * by any number less than its square root
           MOVE 1 TO Is-Prime
           MOVE FUNCTION SQRT(Candidate) TO Root
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > Root
               MOVE FUNCTION MOD(Candidate, I) TO Remain
               IF Remain = 0 THEN
      * if it's evenly divisible, it's not prime
                   MOVE 0 TO Is-Prime
               END-IF
           END-PERFORM
           .

       END PROGRAM Project-Euler-Seven.
