;;;; array.ss
;;;; Provides utility functions for working with lists,
;;;; particularly two dimensional (nested) lists.



;;; Accesses a single atom from a two dimensional array.
;;; (Zero-indexed)
(define (aref array row col)
  (list-ref (list-ref array row) col))
