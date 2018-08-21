#lang racket

(require "../util/data.rkt"
         "018.rkt")

;; Read the triangle from the data file
(define triangle (read-grid "data/067.txt"))

;; Solve the problem
(first (fold-triangle triangle))
