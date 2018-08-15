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
(define (maxl l)
  (if (null? (cdr l))
      (car l)
      (let ((max-cdr (maxl (cdr l))))
        (if (> (car l) max-cdr)
            (car l)
            max-cdr))))

;;; Backwards compatibility with existing problems.
(define (max-value l)
  (maxl l))



;;; Convert a number into a list of all the digits
;;; of that number (in the original order).
(define (number->list n)
  (map (lambda (c)
         (string->number (string c)))
       (string->list (number->string n))))



;;; Given a list, return a sublist of a specified
;;; length from a specified starting position.
;;; Returns '() if the sublist cannot be made (begins
;;; beyond the end of the list, or is longer than
;;; the remaining list.
(define (sublist llist start llength)
  ;; Check for errors in the arguments to avoid
  ;; a problem trying to read from the list.
  (if (or (< start 0)
          (> start (- (length llist) 1))
          (> (+ start llength) (length llist)))
      '()
      ;; Advance down the list by the number
      ;; of positions given by start.
      (if (> start 0)
          (sublist (cdr llist) (- start 1) llength)
          ;; Make a list of length llength using
          ;; the atoms of the original list.
          (if (= llength 0)
              '()
              (cons (car llist)
                    (sublist (cdr llist) start (- llength 1)))))))



;;; Make dotted pairs from an atom and every element
;;; of a list.
(define (dot-atom-list a l)
  (if (null? (cdr l))
      (list `(,a . ,(car l)))
      (append (list `(,a . ,(car l)))
            (dot-atom-list a (cdr l)))))

;;; Run the dotted pair function for two lists such
;;; that every pair between the two lists is made.
(define (every-dot l1 l2)
  (if (null? l1)
      '()
      (append (dot-atom-list (car l1) l2)
              (every-dot (cdr l1) l2))))



