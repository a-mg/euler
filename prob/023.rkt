#lang racket

(require math/number-theory)

;; Predicate which checks if a number is abundant
;; (The sum of its proper divisors is greater than n)
(define (abundant? n)
  (> (- (foldl + 0 (divisors n)) n) n))

;; Get all the abundant numbers in the range
(define abundants (filter abundant? (range 12 28123)))

;; Check if a number can be written as the sum of
;; two abundant numbers
(define (abundant-sum? n)
  ;; Helper, traverse a list of numbers (abundants)
  ;; and check if the difference between n and the
  ;; first number in the list is abundant
  (define (traverse n l)
    (cond
      [(null? l)
        #f]
      [(member (- n (first l)) abundants)
        #t]
      [else
        (traverse n (rest l))]))
  ;; Check the predicate for all abundants
  (traverse n abundants))

;; Find the solution
(foldl + 0 (filter-not abundant-sum? (range 1 28123)))
