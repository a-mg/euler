;;;; probability.ss
;;;; Utility functions for probabilities and combinatorics.



;;; Computes a factorial n!.
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

;;; Computes the binomial coeffecient n choose k.
(define (choose n r)
  (/ (factorial n)
     (* (factorial r)
        (factorial (- n r)))))
