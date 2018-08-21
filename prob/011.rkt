#lang racket

(require math/array
         "../util/data.rkt")

;; Read the data into an array
(define numbers (list*->array (read-grid "data/011.txt") number?))



;;; Functions which calculate a product of four numbers
;;; in the grid in a given direction starting from a given
;;; row and column

;;; Row (horizontal)
(define (*-row arr row col)
  (* (array-ref arr (vector (+ 0 row) col))
     (array-ref arr (vector (+ 1 row) col))
     (array-ref arr (vector (+ 2 row) col))
     (array-ref arr (vector (+ 3 row) col))))

;;; Column (vertical)
(define (*-col arr row col)
  (* (array-ref arr (vector row (+ 0 col)))
     (array-ref arr (vector row (+ 1 col)))
     (array-ref arr (vector row (+ 2 col)))
     (array-ref arr (vector row (+ 3 col)))))

;;; Diagonal down \
(define (*-diag-down arr row col)
  (* (array-ref arr (vector (+ 0 row) (+ 0 col)))
     (array-ref arr (vector (+ 1 row) (+ 1 col)))
     (array-ref arr (vector (+ 2 row) (+ 2 col)))
     (array-ref arr (vector (+ 3 row) (+ 3 col)))))

;;; Diagonal up /
(define (*-diag-up arr row col)
  (* (array-ref arr (vector (+ 0 row) (- col 0)))
     (array-ref arr (vector (+ 1 row) (- col 1)))
     (array-ref arr (vector (+ 2 row) (- col 2)))
     (array-ref arr (vector (+ 3 row) (- col 3)))))



;;; Given a function, grid, and bounds on the row and
;;; column, make a list of all the fours in the grid.
(define (all-fours array direction
                   row-start row-end
                   col-start col-end)
  (let loop-row ([row row-start])
    (if (> row row-end)
        '()
        (append (let loop-col ([col col-start])
                  (if (> col col-end)
                      '()
                      (append (list (apply direction `(,array ,row ,col)))
                              (loop-col (+ col 1)))))
                (loop-row (+ row 1))))))



;;; Assemble all the fours and find the maximum product.
(apply max
       (append
         (all-fours numbers *-row       00 16 00 19)
         (all-fours numbers *-col       00 19 00 16)
         (all-fours numbers *-diag-up   00 16 03 19)
         (all-fours numbers *-diag-down 00 16 00 16)))
