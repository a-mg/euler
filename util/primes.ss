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



;;; Proper divisors
(define (divisors n)
  (append (cdr (factors n)) '(1)))



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



;;; Determine the next prime number to follow a
;;; given prime number.
(define (next-prime n)
  (cond ((< n 2) 2)
        ((= n 2) 3)
        (else (let ((check (+ n 2)))
                (if (prime? check)
                    check
                    (next-prime check))))))

;;; Determine the nth prime number.
(define (nth-prime n)
  (if (= n 1)
      2
      (next-prime (nth-prime (- n 1)))))



;;; Using the Sieve of Eratosthenes algorithm, find
;;; all the primes up to a given limit. 
(define (sieve limit)
  ;; step takes two arguments:
  ;;   primes - List of known primes
  ;;   odds   - Odd numbers to check
  (define (step primes odds)
    ;; Next prime is the first number in odds.
    (let ((p (car odds)))
      ;; If the square of p is larger than the limit,
      ;; the sieve is finished.
      (if (> (square p) limit)
             ;; Reverse append odds to primes.
             (let rev-append ((u primes)
                              (v odds))
               (if (null? u)
                   v
                   (rev-append (cdr u) (cons (car u) v))))
             ;; Otherwise, add p to the primes and remove
             ;; all multiples of p from the odds, advancing
             ;; to the next value of p.
             (step (cons p primes)
                   (let wheel ((clean '())
                               (dirty (cdr odds))
                               (loser (square p)))
                     ;; If there are no more numbers in the dirty
                     ;; list, the wheel is finished.
                     (cond ((null? dirty) (reverse clean))
                           ;; Operate on the first dirty number.
                           ;; If it's the loser, take it out.
                           ((= (car dirty) loser) (wheel clean (cdr dirty) (+ loser p)))
                           ;; If it's greater than the loser, we've
                           ;; already deleted the loser as a multiple
                           ;; of a smaller p. Increment the loser.
                           ((> (car dirty) loser) (wheel clean dirty (+ loser p)))
                           ;; Otherwise, we've got a coprime, so add it
                           ;; to the clean list and continue.
                           (else (wheel (cons (car dirty) clean) (cdr dirty) loser))))))))
    ;; Return the list of primes.
    (step '(2)
          (iota (- (ceiling (/ limit 2)) 1) 3 2)))
