#lang racket

(require "../util/sequence.rkt")

(define seq-lengths
  (map length
       (map collatz
            (range 1 1000000))))

(+ 1 (index-of seq-lengths (apply max seq-lengths)))
