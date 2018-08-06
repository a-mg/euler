(load "util.ss")



; Given a list of integers, returns the subset of that
; list which is divisible by 3 or 5.
(define (multiples-of-3-and-5 ints)
  (if (null? ints)
      `()
      (if (or (= (modulo (car ints) 3) 0)
              (= (modulo (car ints) 5) 0))
          (cons (car ints)
                (multiples-of-3-and-5 (cdr ints)))
          (multiples-of-3-and-5 (cdr ints)))))

; Solve the problem
(sum-list (multiples-of-3-and-5 (ints-n-to-m 1 999)))
