#lang racket

(require math/number-theory)

(do ([n 1 (+ n 1)])
    ((> (length (divisors (triangle-number n))) 500)
     (triangle-number n)))
