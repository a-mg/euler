(load "util/list.ss")
(load "util/primes.ss")



;;; Determine the next prime number to follow a
;;; given prime number.
(define (next-prime n)
  (if (= n 2)
      3
      (let ((check (+ n 2)))
        (if (prime? check)
            check
            (next-prime check)))))

;;; Determine the nth prime number.
(define (nth-prime n)
  (if (= n 1)
      2
      (next-prime (nth-prime (- n 1)))))

;;; Solve the problem.
(nth-prime 10001)
