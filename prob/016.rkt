#lang racket

(require "../util/number.rkt")

(foldl + 0 (number->list (expt 2 1000)))
