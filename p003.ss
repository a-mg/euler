; Helper recursive function which determines all of the
; factors of a given number, n.
(define (recursive-factors number current)
  (if (= 1 current)
      '()
      (if (= 0 (modulo number current))
          (cons current
                (recursive-factors number (- current 1)))
          (recursive-factors number (- current 1)))))

; Nicer function which takes only one argument.
(define (factors-of-n n)
  (recursive-factors n n))

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
