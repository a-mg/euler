#lang racket

(require math/number-theory
         threading
         "../util/number.rkt")

;; Check if a number is a `factorion`
(define (factorion? n)
  (~>> n
       number->list
       (map factorial)
       (apply +)
       (= n)))

;; Using the upper bound (found), calculate the sum
;; of the factorions in the allowable range
(~>> (range 3 1499999)
     (filter factorion?)
     (apply +))
