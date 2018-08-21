#lang racket

(provide read-number)

;;; Reads a number from a file, containing that number on
;;; a single line.
(define (read-number path)
  (with-input-from-file path
    (lambda () (string->number (read-line)))))
