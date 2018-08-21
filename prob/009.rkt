#lang racket

;;; Check if given values of k, m, n yield a Pythagorean triple
;;; where a+b+c = 1000. If so, return a*b*c. Otherwise, #f.
(define (solved k m n)
  (let ([a (* k (- (expt m 2) (expt n 2)))]
        [b (* k 2 m n)]
        [c (* k (+ (expt m 2) (expt n 2)))])
    (cond
      [(= 1000 (+ a b c)) (* a b c)]
      [else #f])))

(for ([k (in-range 1 100)])
  (for ([m (in-range 2 1000)])
    (for ([n (in-range 1 m)]
          #:when (solved k m n))
      (printf "~a~n" (solved k m n)))))
