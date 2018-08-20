#lang racket

(provide number->list)

;;; Converts a number into a list of digits.
(define (number->list n)
  (map string->number
       (map string
            (string->list
              (number->string
                n)))))
