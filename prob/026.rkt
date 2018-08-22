#lang racket

(require math/number-theory)

;; Determine if a number is coprime with 10.
(define (coprime-10? n)
  (coprime? n 10))

;; Calculate the multiplicate order of a (mod n).
;; https://en.wikipedia.org/wiki/Multiplicative_order
;; (used to determine period of repetend later)
(define (mult-order a n)
  (do ([k 1 (+ 1 k)])
      ((= 1 (modulo (expt a k) n))
       k)))

;; Discrete logarithm (multiplicative order of 10 (mod n))
(define (discrete-log n)
  (mult-order 10 n))

(define primes (filter coprime-10? (range 2 1000)))
(define lengths (map discrete-log primes))

(list-ref primes (index-of lengths (apply max lengths)))
