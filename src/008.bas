0000 REM 009:
0000 REM
0000 REM A Pythagorean triplet is a set of three natural numbers, a < b < c, for
0000 REM which, a^2 + b^2 = c^2. For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
0000 REM
0000 REM There exists exactly one Pythagorean triplet for which a + b + c = 1000.
0000 REM Find the product abc.
0000 REM
0000 REM Implementation: this program was run using cbmbasic, an interpreter for
0000 REM Commodore BASIC, which is available in Homebrew (on a Mac):
0000 REM https://github.com/mist64/cbmbasic

0000 REM Main loops
0010 FOR K = 1 TO 100
0020 FOR M = 2 TO 1000
0030 FOR N = 1 TO M
0040 GOSUB 1000
0050 IF NOT PY = 0 THEN GOTO 0100
0060 NEXT N
0070 NEXT M
0080 NEXT K

0100 REM Answer found, print it out
0110 PRINT PY
0120 END

1000 REM Check Pythagorean triple given k, m, n, calculating product
1010 LET A = K * ((M * M) - (N * N))
1020 LET B = K * 2 * M * N
1030 LET C = K * ((M * M) + (N * N))
1040 LET PY = 0
1050 IF (A + B + C) = 1000 THEN LET PY = A * B * C
1060 RETURN
