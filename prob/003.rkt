#lang racket

(require math/number-theory)

;;; Find the maximum prime factor of the number.
(foldl max 0 (prime-divisors 600851475143))
