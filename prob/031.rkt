#lang racket

;; Recursive calculation of the `coin change problem`
(define (coin-change amount coins)
  (cond
    [(= 0 amount)
      1]
    [(< amount 0)
      0]
    [(and (>= amount 0)
          (null? coins))
      0]
    [else
      (+ (coin-change (- amount (first coins)) coins)
         (coin-change amount (rest coins)))]))

(coin-change 200 '(200 100 50 20 10 5 2 1))
