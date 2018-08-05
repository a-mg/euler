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

