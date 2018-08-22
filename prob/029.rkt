#lang racket

(require "../util/list.rkt")

;; Given a list containing two integers a and b, find a^b.
(define (pow-pair l)
  (expt (first l)
        (second l)))

;; Find the solution
(length (sort (remove-duplicates (map pow-pair
                                      (pair-off (range 2 101)
                                                (range 2 101))))
              <))
