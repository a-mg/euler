;;;; list.ss
;;;; Utility functions for dealing with lists,
;;;; generating lists of numbers, etc.



;;; Generates a list of integers from n to me, in
;;; increasing order if n<m or decreasing if n>m.
(define (range n m)
  (cond ((< m n) (reverse (range m n)))
        ((= n m) (list n))
        (else    (cons n (range (+ n 1) m)))))

;;; Backwards compatibility with existing problems.
(define (ints-n-to-m n m)
  (range n m))



;;; Find the sum of a list of numbers.
(define (sum l)
  (if (null? (cdr l))
      (car l)
      (+ (car l)
         (sum (cdr l)))))

;;; Backwards compatibility with existing problems.
(define (sum-list ints)
  (sum ints))



;;; Find the maximum number in a list. There is a
;;; built-in function, max, which can do something
;;; similar, but you need to apply it. I mostly wrote
;;; this as an exercise.
(define (max-in l)
  (if (null? (cdr l))
      (car l)
      (let ((max-cdr (max-in (cdr l))))
        (if (> (car l) max-cdr)
            (car l)
            max-cdr))))

;;; Backwards compatibility with existing problems.
(define (max-value l)
  (max-in l))
