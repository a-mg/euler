#lang racket

(require threading
         "../util/number.rkt"
         "../util/list.rkt")

;; Determine if a number (given in base 10) is a palindrome
;; in both base 10 and base 2
(define (two-base-palindrome? n)
  (and (palindrome? (number->list n))
       (palindrome? (string->list (number->string n 2)))))

;; Find the solution
(~>> (range 1 1000000)
     (filter two-base-palindrome?)
     (apply +))
