; List all the integers from n to m
(define (ints-n-to-m n m)
  (if (= n m)
      (list n)
      (cons n (ints-n-to-m (+ n 1) m))))

; Find the sum of the list of integers (probably a built-in
; function, but I want to write it anyway).
(define (sum-list ints)
  (if (null? (cdr ints))
      (car ints)
      (+ (car ints)
         (sum-list (cdr ints)))))

; Get the maximum number in a list.
(define (max-value l)
  (if (null? (cdr l))
      (car l)
      (let ((max-cdr (max-value (cdr l))))
        (if (> (car l) max-cdr)
            (car l)
            max-cdr))))



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



; Check if an integer is prime.
(define (is-prime? n)
  (= (length (factors-of-n n)) 1))

; Remove all the composite numbers from a list.
(define (primes ints)
  (if (null? ints)
      '()
      (if (is-prime? (car ints))
          (cons (car ints)
                (primes (cdr ints)))
          (primes (cdr ints)))))

; 'Prime-candidate' factors are those which are less
; than or equal to the square root of n.
(define (prime-candidate-factors-of-n n)
  (recursive-factors n (floor (sqrt n))))

; List the prime factors of n.
(define (prime-factors-of-n n)
  (primes (prime-candidate-factors-of-n n)))



; Largest number below a given number that is
; a prime number.
(define (largest-prime-divisor-helper num test)
  (if (= test 1)
      num
      (if (and (is-prime? test)
               (= 0 (modulo num test)))
          test
          (largest-prime-divisor-helper num (- test 1)))))

(define (largest-prime-divisor n)
  (largest-prime-divisor-helper n n))

; Find the prime decomposition of a number.
(define (prime-decom n)
  (if (is-prime? n)
      (list n)
      (let* ((factor (largest-prime-divisor n))
             (rest   (prime-decom (/ n factor))))
        (cons factor rest))))
