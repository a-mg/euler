#lang racket

(provide collatz)

;;; Given an integer n, generate the Collatz sequence
;;; beginning from n (as a list).
(define (collatz n)
  (cond
    [(= n 1)
      '(1)]
    [(even? n)
      (cons n (collatz (/ n 2)))]
    [(odd? n)
      (cons n (collatz (+ (* 3 n) 1)))]))
