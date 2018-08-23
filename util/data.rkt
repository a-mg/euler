#lang racket

(require threading)

(provide read-number
         read-numbers
         read-csv-strings
         read-grid)

;;; Reads a number from a file, containing that number on
;;; a single line.
(define (read-number path)
  (~> path
      open-input-file
      read-line
      string->number))

;;; Reads a list of numbers from a file, one number per line.
(define (read-numbers path)
  (~>> path
       open-input-file
       port->lines
       (map string->number)))

;;; Reads a list of quoted strings that are separated by commas,
;;; splitting on the commas and trimming the quotes.
(define (read-csv-strings path)
  (~> path
      open-input-file
      port->string
      (string-replace "\"" "")
      (string-split ",")))

;;; Reads a grid of numbers from a file: each line is a list
;;; of numbers, contained within a wrapping list.
(define (read-grid path)
  ;; Helper, converts strings in nested list to numbers.
  (define (make-integers l)
    (map string->number l))
  ;; Read in the grid of numbers.
  (~>> path
       open-input-file
       port->lines
       (map string-split)
       (map make-integers)))
