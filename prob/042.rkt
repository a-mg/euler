#lang racket

(require math/number-theory
         threading
         "../util/data.rkt")

(define (word-triangle? str)
  (~>> str
       string->list
       (map char->integer)
       (map (lambda (l) (- l 64)))
       (apply +)
       triangle-number?))

(~>> (read-csv-strings "data/042.txt")
     (filter word-triangle?)
     length)
