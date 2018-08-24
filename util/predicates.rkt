#lang racket

(provide all?)

;; Checks if every element of the list lst satisfies the
;; predicate v
(define (all? v lst)
  (cond
    [(= 1 (length lst))
      (v (first lst))]
    [else
      (and (v (first lst))
           (all? v (rest lst)))]))
