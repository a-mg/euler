; List all the integers from n to m
(define (ints-n-to-m n m)
  (if (= n m)
      (list n)
      (cons n (ints-n-to-m (+ n 1) m))))


