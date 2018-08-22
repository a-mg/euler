#lang racket

(require "../util/number.rkt")

;; The maximum digital sum (order k) with d digits is d terms
;; of 9 raised to the power k.
(define (max-digital-sum k d)
  (* d (expt 9 k)))

;; The upper limit is when a number is greater than the
;; maximum possible sum of digits (order k)
(define ubound
  (do ([digits 1 (+ digits 1)])
      ((> (expt 10 digits) (max-digital-sum 5 digits))
       (expt 10 digits))))

;; Determine if a number is a perfect digital invariant
(define (pdi? n)
  ;; Helper, raise a number to the fith power
  (define (pow-5 n)
    (expt n 5))
  ;; Predicate
  (= n (foldl + 0 (map pow-5 (number->list n)))))

;; Find the solution
(foldl + 0 (filter pdi? (range 2 ubound)))
