(load "util/primes.ss")



;;; Check if a number is an amicable number.
(define (amicable? n)
  (and (not (prime? n))
       (let* ((d-n  (reduce-left + 0 (divisors n)))
              (dd-n (reduce-left + 0 (divisors d-n))))
         (and (not (= d-n n))
              (= dd-n n)))))

;;; Find the solution.
(reduce-left + 0
  (filter amicable?
    (iota 10000 1)))
