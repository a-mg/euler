#lang racket

(require srfi/13
         srfi/14
         "../util/number.rkt")

(define (delete-chars s)
  (string-delete (char-set #\- #\, #\space) s))

(foldl + 0
       (map string-length
            (map delete-chars
                 (map number->text (range 1 1001)))))
