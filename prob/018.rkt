#lang racket

(require "../util/data.rkt")

;; Provide the fold-triangle function for problem 067.
(provide fold-triangle)

;; Read the triangle from the data file
(define triangle (read-grid "data/018.txt"))

;;; Given a list, produce a new list where each atom in
;;; position n is the maximum between the atoms at
;;; positions n and n+1 in the original list.
(define (snap-left ints)
  ;; Helper, remove the last atom from a list if the list
  ;; length is longer than one
  (define (trim l)
    (cond
      [(> (length l) 1)
        (reverse (rest (reverse l)))]
      [else
        l]))
  ;; Helper, perform the snap-left comparisons on a list
  (define (do-snap l)
    (cond
      [(null? (rest l))
        l]
      [else
        (cons (max (first l)
                   (second l))
              (do-snap (rest l)))]))
  ;; Perform both actions
  (trim (do-snap ints)))

;;; Given a triangle (list of lists), add each row to the
;;; snapped-left version of the next row. The final result
;;; is the maximum path through the triangle.
(define (fold-triangle tri)
  (cond
    [(null? (rest tri))
      (first tri)]
    [else
      (map + (first tri) (snap-left (fold-triangle (rest tri))))]))

;; Solve the problem
(first (fold-triangle triangle))
