#lang racket

(require math/number-theory
         "../util/list.rkt")

;; Predicate which checks if a number is abundant
;; (The sum of its proper divisors is greater than n)
(define (abundant? n)
  (> (- (foldl + 0 (divisors n)) n) n))

;; Get all the abundant numbers in the range
(define abundants (filter abundant? (range 12 28123)))

;; Calculate all the sums of two abundants numbers given
;; the range specified above
(define abundant-sums
  (map (lambda (l) (foldl + 0 l))
       (pair-off abundants abundants)))

;; Find the list of integers in the problem range which
;; cannot be written as the sum of two abundant numbers.
(define numbers (remove* abundant-sums (range 24 28123)))

(length numbers)
