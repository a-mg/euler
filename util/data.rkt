#lang racket

(provide read-number
         read-numbers
         read-csv-strings
         read-grid)

;;; Reads a number from a file, containing that number on
;;; a single line.
(define (read-number path)
  (with-input-from-file path
    (lambda () (string->number (read-line)))))

;;; Reads a list of numbers from a file, one number per line.
(define (read-numbers path)
  (map string->number
       (port->lines (open-input-file path))))

;;; Reads a list of quoted strings that are separated by commas,
;;; splitting on the commas and trimming the quotes.
(define (read-csv-strings path)
  (string-split (string-replace (port->string (open-input-file path))
                                "\""
                                "")
                ","))

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
