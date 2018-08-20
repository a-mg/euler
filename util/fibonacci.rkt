#lang racket

(provide fibonacci)

;;; Given an integer n, calculate the nth Fibonacci number.
;;; F(1) = 1
;;; F(2) = 2
;;; F(n) = F(n-1) + F(n-2)
(define (fibonacci n)
  (cond
    [(= n 1) 1]
    [(= n 2) 2]
    [else (+ (fibonacci (- n 1))
             (fibonacci (- n 2)))]))
