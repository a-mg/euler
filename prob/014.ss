;;; Given a starting integer n, create a list containing
;;; the Collatz sequence from n to 1.
;;; n -> n/2  (n is even)
;;; n -> 3n+1 (n is odd)
(define (collatz n)
  (if (<= n 1)
      '(1)
      (let ((next-n (if (even? n)
                        (/ n 2)
                        (+ (* 3 n) 1))))
        (cons n (collatz next-n)))))



;;; Loop through the integers i = 1..1,000,000, determining
;;; the maximum Collatz sequence for each integer.
(let loop ((i    1)  ; Current integer
           (maxl 0)  ; Maximum length found
           (maxi 0)) ; Integer at maximum length
  (if (> i 1000000)
      ;; Checking has finished, return the answer.
      maxi
      ;; Otherwise continue
      (let ((lengthi (length (collatz i))))
        (if (> lengthi maxl)
            ;; The current i is the new maximum:
            (loop (+ i 1) lengthi i)
            ;; Otherwise, keep the current maximum:
            (loop (+ i 1) maxl maxi)))))
