#lang racket

(let* ([square
         ;; Helper which squares a number.
         (lambda (l) (expt l 2))]
       [sum-squares
         ;; Find the sum of the squares of 1..100
         (foldl + 0 (map square (range 1 101)))]
       [square-sum
         ;; Find the square of the sum of 1..100
         (square (foldl + 0 (range 1 101)))])
  ;; Find the difference
  (- square-sum sum-squares))
