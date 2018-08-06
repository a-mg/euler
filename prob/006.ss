(load "util/list.ss")



;; Get the natural numbers 1..100.
(define naturals (range 1 100))

;; Solve the problem.
(- (square (sum naturals))
   (sum (map square naturals)))
