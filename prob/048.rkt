#lang racket

(require threading)

(~>> (range 1 1001)
     (map (lambda (l) (expt l l)))
     (apply +)
     number->string
     ((lambda (s) (substring s (- (string-length s) 10)))))
