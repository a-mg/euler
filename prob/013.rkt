#lang racket

(require "../util/data.rkt")

(substring (number->string (foldl + 0 (read-numbers "data/013.txt")))
           0 10)
