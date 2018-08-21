#lang racket

(require "../util/data.rkt")

;;; Function which calculates the name score of a string.
(define (name-score name)
  (foldl + 0 (map (lambda (l)
                    (- (char->integer l)
                       64))
                  (string->list name))))

;; Read the sorted names
(define names (sort (read-csv-strings "data/022.txt") string<?))

;; Calculate the sum of the name scores
(foldl + 0 (map (lambda (l)
                  (* (name-score l)
                     (+ 1 (index-of names l))))
                names))
