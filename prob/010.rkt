#lang racket

(require math/number-theory)

(foldl + 0 (filter prime? (range 1 2000001)))
