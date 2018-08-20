#lang racket

(require "../util/number.rkt"
         "../util/list.rkt")

;;; Find the maximum palindromic number that is a product
;;; of numbers within a given list.
(define (max-palindrome llist)
  ;; Helper which finds the product of a list.
  (define (product l)
    (foldl * 1 l))
  ;; Helper which checks if a number is a palindrome.
  (define (palindrome-number? n)
    (palindrome? (number->list n)))
  ;; Apply the helpers to find the answer.
  (foldl max 0
         (filter palindrome-number?
                 (map product
                      (pair-off llist llist)))))

;;; Apply the function to the stated problem range.
(max-palindrome (range 100 999))
