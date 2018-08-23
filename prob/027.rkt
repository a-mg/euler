#lang racket

(require math/number-theory
         "../util/list.rkt")

;; Given two coefficients a and b, count the number of consecutive
;; primes that are generated with increasing values of n
;; n^2 + an + b
(define (count-primes a b)
  (do ([n 0 (+ n 1)])
      ((not (prime? (+ (expt n 2)
                       (* a n)
                       b)))
       n)))

;; Mapping which calls count-primes for a list of two numbers
(define (map-count-primes l)
  (count-primes (first l)
                (second l)))

;; Find the solution
(let* ([a             (range -999 1000)]
       [b             (range -1000 1001)]
       [coefficients  (pair-off a b)]
       [lengths       (map map-count-primes coefficients)]
       [index         (index-of lengths (apply max lengths))]
       [solution-pair (list-ref coefficients index)]
       [solution      (apply * solution-pair)])
  solution)
