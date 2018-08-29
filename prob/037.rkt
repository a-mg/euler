#lang racket

(require math/number-theory
         "../util/number.rkt")

;; Predicate which checks if a number is a truncatable prime
;; (in both directions)
(define (trunc-prime? n)
  ;; Helper, truncate a number one digit (from the left)
  (define (cut-first n)
    (modulo n (expt 10 (- (digits n) 1))))
  ;; Helper, truncate a number one digit (from the right)
  (define (cut-last n)
    (floor (/ n 10)))
  ;; Helper, is a prime left-truncatable?
  (define (left-trunc? n)
    (cond
      [(= 1 (digits n))
        (prime? n)]
      [else
        (and (prime? n)
             (left-trunc? (cut-first n)))]))
  ;; Helper, is a prime right-truncatable?
  (define (right-trunc? n)
    (cond
      [(= 1 (digits n))
        (prime? n)]
      [else
        (and (prime? n)
             (right-trunc? (cut-last n)))]))
  ;; Main predicate
  (and (prime? n)
       (left-trunc? n)
       (right-trunc? n)))

;; Collect truncatable primes until we have 11, which is the
;; specified maximum. The smallest truncatable prime is 23,
;; so we can begin from that lower bound
(define trunc-primes
  (let loop ([collect '()]
             [prime   23])
    (cond
      [(= 11 (length collect))
        collect]
      [(trunc-prime? prime)
        (loop (append collect (list prime)) (next-prime prime))]
      [else
        (loop collect (next-prime prime))])))

;; Find the answer
(apply + trunc-primes)
