(load "util.ss")



; 'Prime-candidate' factors are those which are less
; than or equal to the square root of n.
(define (prime-candidate-factors-of-n n)
  (recursive-factors n (floor (sqrt n))))

; List the prime factors of n.
(define (prime-factors-of-n n)
  (primes (prime-candidate-factors-of-n n)))



; Return the larger of two integers.
(define (larger n m)
  (if (> n m)
      n
      m))

; Find the largest value in a list of integers.
(define (largest ints)
  (if (null? (cdr ints))
      (car ints)
      (larger (car ints)
              (largest (cdr ints)))))



; Solve the problem
(largest (prime-factors-of-n 600851475143))
