(load "util/list.ss")
(load "util/primes.ss")



;;; Using the prime sieve, add together all the primes
;;; below two million.
(reduce-left + 0 (sieve 2000000))
