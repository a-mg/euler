#lang racket

(require math/number-theory
         "../util/number.rkt")

;; Make a Fibonacci generator with the first terms 1, 1.
(define gen-fib (make-fibonacci 1 1))

;;; 'Climb' the Fibonacci sequence, given a starting index,
;;; until a number is found with 1000 digits.
(define (climb-fibonaccis index)
  (let ([next (gen-fib index)])
    (cond 
      [(= 1000 (digits next))
        index]
      [else
        (climb-fibonaccis (+ 1 index))])))

(+ 1 (climb-fibonaccis 1))
