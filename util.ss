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

