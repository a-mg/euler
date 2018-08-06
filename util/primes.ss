;;;; primes.ss
;;;; Utility functions for working with prime numbers and
;;;; prime factorizations of numbers.



;;; Lists all of the factors of a given number.
;;; (Helper function, not directly called.)
(define (recursive-factors number current)
  (if (= 1 current)
      '()
      (if (= 0 (modulo number current))
          (cons current
                (recursive-factors number (- current 1)))
          (recursive-factors number (- current 1)))))

;;; Takes a single argument and lists all the
;;; factors of that number.
(define (factors n)
  (recursive-factors n n))

;;; Backwards compatibility with existing problems.
(define (factors-of-n n)
  (recursive-factors n n))



;;; Check if an integer is prime. Checks if there is
;;; only one factor of n (therefore prime).
(define (prime? n)
  (= (length (recursive-factors n (floor (sqrt n))))
     0))

;;; Backwards compatibility with existing problems.
(define (is-prime? n)
  (prime? n))



;;; Return a list of all the prime numbers that exist
;;; within a given list of numbers.
(define (primes ints)
  (if (null? ints)
      '()
      (if (prime? (car ints))
          (cons (car ints)
                (primes (cdr ints)))
          (primes (cdr ints)))))



;;; Determine the prime factors of a given number n.
;;; It is only necessary to check factors which are
;;; less than or equal to the square root of n.
(define (prime-factors n)
  (primes (recursive-factors n (floor (sqrt n)))))

;;; Backwards compatibility with existing problems.
(define (prime-factors-of-n n)
  (prime-factors n))



;;; Find the largest prime number below a given number
;;; n that is a divisor of that number. (Helper function.)
(define (recursive-largest-prime-divisor n test)
  (if (= test 1)
      n
      (if (and (prime? test)
               (= 0 (modulo n test)))
          test
          (recursive-largest-prime-divisor n (- test 1)))))

;;; Single argument version of the previous.
(define (largest-prime-divisor n)
  (recursive-largest-prime-divisor n n))



;;; Find the prime factorization/decomposition of a given
;;; number n. This will return a list of primes which,
;;; multiplied together, equal n. This is different from
;;; prime-factors, which will only return one of each of
;;; n's prime factors. Example:
;;;     (prime-factors 4)        =>  (2)
;;;     (prime-factorization 4)  =>  (2 2)
(define (prime-factorization n)
  (if (prime? n)
      (list n)
      (let* ((factor (largest-prime-divisor n))
             (rest   (prime-factorization (/ n factor))))
        (cons factor rest))))

;;; Backwards compatibiltiy with existing problems.
(define (prime-decom n)
  (prime-factorization n))
