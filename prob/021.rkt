#lang racket

(require math/number-theory)

;;; Check if a number is part of an amicable pair.
(define (amicable? a)
  ;; Helper which sums the proper divisors
  (define (sum-divisors n)
    (foldl + 0 (reverse (rest (reverse (divisors n))))))
  ;; Calculate the number b
  (define b (sum-divisors a))
  ;; Predicate for amicability
  (and (not (= a b))
       (= a (sum-divisors b))))

;; Solve the problem
(foldl + 0 (filter amicable? (range 2 10000)))
