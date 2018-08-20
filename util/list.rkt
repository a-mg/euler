#lang racket

(provide palindrome?
         pair-off)

;;; Determines if a list is a palindrome (reads the same backwards
;;; and forwards).
(define (palindrome? llist)
  ;; Helper which trims the first and last elements from a list.
  (define (trim llist)
    (cdr (reverse (cdr (reverse llist)))))
  ;; Implementation of the palindrome? predicate.
  (cond
    ;; If the list contains 0 or 1 atoms, it is a palindrome
    ;; by default.
    [(or (= 0 (length llist))
         (= 1 (length llist)))
     #t]
    ;; Otherwise, the first and last elements of the list
    ;; must the same, as must the list that remains when
    ;; these elements are trimmed off.
    [else
      (and (equal? (car llist)
                   (last llist))
           (palindrome? (trim llist)))]))

;;; Given two lists, make a new list which contains every pairing
;;; of the elements contained in the source lists (as member lists).
;;; For example, pairing '(1 2) with '(3 4) yields:
;;; '((1 3) (1 4) (2 3) (2 4))
(define (pair-off list1 list2)
  ;; Helper which pairs an atom with every element of a list.
  (define (pair-atom-list atom llist)
    (if (null? llist)
        '()
        (append (list (list atom (car llist)))
                (pair-atom-list atom (cdr llist)))))
  ;; For every element in list1, call the helper with list2.
  (if (null? list1)
      '()
      (append (pair-atom-list (car list1) list2)
              (pair-off (cdr list1) list2))))
