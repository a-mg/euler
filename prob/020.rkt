#lang racket

(require math/number-theory
         "../util/number.rkt")

(foldl + 0 (number->list (factorial 100)))
