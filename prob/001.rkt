#lang racket

;;; Given a list of integers, calculate the sum of the
;;; members of the list that are multiples of 3 or 5.
(define (sum-3s-and-5s ints)
  ;; Helper predicate that checks if an integer is
  ;; divisible by 3 or 5.
  (define (multiple? n)
    (or (= 0 (modulo n 3))
        (= 0 (modulo n 5))))
  ;; Calculate the sum by folding the filtered list.
  (foldl + 0 (filter multiple? ints)))

;;; Apply the function to the specified range.
(sum-3s-and-5s (range 1 1000))
