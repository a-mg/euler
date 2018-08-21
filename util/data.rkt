#lang racket

(provide read-number
         read-grid)

;;; Reads a number from a file, containing that number on
;;; a single line.
(define (read-number path)
  (with-input-from-file path
    (lambda () (string->number (read-line)))))

;;; Reads a grid of numbers from a file: each line is a list
;;; of numbers, contained within a wrapping list.
(define (read-grid path)
  ;; Helper, converts strings in nested list to numbers.
  (define (make-integers l)
    (map string->number l))
  ;; Read in the grid of numbers.
  (map make-integers
       (map string-split
            (port->lines (open-input-file path)))))
