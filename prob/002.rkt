#lang racket

(require math/number-theory)

;;; 'Climb' the Fibonacci sequence, given a starting index and a
;;; maximum value, constructing a list of the found values.
(define (climb-fibonaccis index limit llist)
  ;; Calculate the next Fibonacci number.
  (let ([next (fibonacci index)])
    (if (< next limit)
        ;; Next is allowable, so add it to the list and continue.
        (climb-fibonaccis (+ 1 index)
                          limit
                          (append llist `(,next)))
        ;; Otherwise, return the list as it exists.
        llist)))

;;; Find the sum of the even valued terms in a list of
;;; Fibonacci numbers below 4,000,000.
(foldl + 0 (filter even? (climb-fibonaccis 1 4000000 '())))
