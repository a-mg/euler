(load "util.ss")



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
