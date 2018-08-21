#lang racket

(require "../util/data.rkt"
         "../util/list.rkt"
         "../util/number.rkt")

;;; Generate all the sublists of length 13 from a given list.
(define (all-13s llist)
  (cond
    [(< (length llist) 13)
      '()]
    [else
      (append (list (sublist llist 0 13))
              (all-13s (rest llist)))]))

;;; Find the solution.
(apply max
       (map (lambda (l) (foldl * 1 l))
            (all-13s
              (number->list
                (read-number "data/008.txt")))))
