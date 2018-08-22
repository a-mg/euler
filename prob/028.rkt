#lang racket

;; Calculate the nth value of the sequence containing
;; the numbers on the diagonals of Ulam's spiral.
;; (1-indexed)
(define (ulam-diag n)
  (+ (floor (/ (* n (+ n 2)) 4))
     (floor (/ (modulo n 4) 3))
     1))

;; Solve the problem
;; (For a square of dimension s, there are 2s-1 numbers
;; that fall on the diagonals. So, in order to find the
;; 2s-1 terms of the Ulam diagonal sequence, use the range
;; 1..2s.
(foldl + 0 (map ulam-diag (range 1 2002)))
