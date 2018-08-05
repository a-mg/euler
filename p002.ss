(load "util.ss")



; Generate a list of Fibonacci numbers with length n.
; (Unused in solution)
(define (fibonacci n)
  (cond ((= n 1) '(1))
        ((= n 2) '(1 2))
        (else
          (let* ((prev (fibonacci (- n 1)))
                 (rev (reverse prev)))
            (append prev (list (+ (car rev) (cadr rev))))))))

; Generates a list of all the Fibonacci numbers less than or 
; equal to a specific limit, given a starting pair.
; (In reverse order)
(define (fibs-less-than-n fibs n)
  (let ((next (+ (car fibs)
                 (cadr fibs))))
    (if (<= next n)
        (fibs-less-than-n (cons next fibs) n)
        fibs)))

; Given a list, return only the even values.
(define (evens l)
  (if (null? l)
      '()
      (if (even? (car l))
          (cons (car l) (evens (cdr l)))
          (evens (cdr l)))))

; Solve the problem
(sum-list (evens (fibs-less-than-n '(2 1) 4000000)))
