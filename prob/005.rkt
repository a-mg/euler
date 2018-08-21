#lang racket

(require math/number-theory)

;;; Zips two lists of prime factorizations together, choosing
;;; the higher exponent when a prime base is the same.
(define (zip-factors left right)
  ;; Helper, gets the first prime number.
  (define (first-prime l)
    (first (first l)))
  ;; Helper, gets the first exponent.
  (define (first-expt l)
    (first (rest (first l))))
  ;; Perform the zipping.
  (cond
    [(and (null? left) (null? right))
      ;; At the end of both lists, so finish.
      '()]
    [(and (not (null? left)) (null? right))
      ;; At the end of left, but still have some factors
      ;; in right, so append them, and finish.
      left]
    [(and (null? left) (not (null? right)))
      ;; At the end of right, but still have some factors
      ;; in left, so append them, and finish.
      right]
    [(= (first-prime left) (first-prime right))
      ;; Choose the pair with the maximum exponent and
      ;; advance both lists.
      (define choose-pair
        (if (> (first-expt left) (first-expt right))
            (first left)
            (first right)))
      (append (list choose-pair)
              (zip-factors (rest left) (rest right)))]
    [(< (first-prime left) (first-prime right))
      ;; Add the pair from the left, and advance left only.
      (append (list (first left))
              (zip-factors (rest left) right))]
    [(> (first-prime left) (first-prime right))
      ;; Add the pair from the right, and advance right only.
      (append (list (first right))
              (zip-factors left (rest right)))]))

;;; Calculate the solution.
(defactorize
  (foldl zip-factors
               '()
               (map factorize
                    (range 2 21))))
