#lang racket

(require math/number-theory
         threading
         "../util/number.rkt"
         "../util/predicates.rkt")

;; Helper which checks if a number contains the digit
;; 0 (which will cause the rotations to fail)
(define (zero-digit? num)
  (~> num
      number->string
      (string-contains? "0")))

(~>> (range 2 1000000)
     (filter-not zero-digit?)
     (filter prime?)
     (map rotations)
     (filter ((curry all?) prime?))
     length)
