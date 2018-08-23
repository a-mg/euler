#lang racket

(require math/number-theory
         "../util/list.rkt")

;; Predicate which checks if a number is abundant
;; (The sum of its proper divisors is greater than n)
(define (abundant? n)
  (> (- (foldl + 0 (divisors n)) n) n))

;; Get all the abundant numbers in the range
(define abundants (filter abundant? (range 12 28123)))

;; Given a list of numbers, calculate all the sums
;; made from two of those numbers which do not exceed a
;; given upper bound
(define (all-sums numbers ubound)
  ;; Helper, given a number n and a list of numbers l,
  ;; return a list of all the sums of n and l_i that do
  ;; not exceed the limit ubound
  (define (loop-number n l u)
    (cond
      [(null? l)
        '()]
      [(>= (+ n (first l)) u)
        '()]
      [else
        (cons (+ n (first l))
              (loop-number n (rest l) u))]))
  ;; Helper, given a list of numbers, call loop-number
  ;; with every element in the list
  (define (loop-list l1 l2 u)
    (cond
      [(null? l1)
        '()]
      [else
        (append (loop-number (first l1) l2 u)
                (loop-list (rest l1) l2 u))]))
  ;; List the sums
  (remove-duplicates (loop-list numbers numbers ubound)))

;; Find the solution
(- (apply + (range 1 28123))
   (apply + (all-sums abundants 28123)))
