#lang racket

;;;; 008:
;;;;
;;;; The four adjacent digits in the 1000-digit number that have the greatest
;;;; product are 9 × 9 × 8 × 9 = 5832.
;;;;
;;;; Find the thirteen adjacent digits in the 1000-digit number that have the
;;;; greatest product. What is the value of this product?

(define (read-number-as-list path)
  (map string->number
       (map string
            (string->list
              (read-line
                (open-input-file path))))))

(define (group-13s lst)
  ;; helper
  (define (here+13 lst idx)
    (if (= idx 0)
        '()
        (cons (first lst)
              (here+13 (rest lst) (- idx 1)))))
  ;; make groups of 13 for whole list
  (if (< (length lst) 13)
      '()
      (cons (here+13 lst 13)
            (group-13s (rest lst)))))

(foldl max 0
       (map (lambda (l)
              (foldl * 1 l))
            (group-13s
              (read-number-as-list "../data/008.txt"))))
