(load "../util/list.ss")
(load "../util/primes.ss")



; The smallest number n which is divisible evenly
; by all the integers in the range i..j can be found
; by taking the product of the set of all prime
; factors of i..j that are not repeated.
;
; In other words: if I have a number n, which primes
; do I accumulate when I make the number n+1? If I
; already have the prime factors of n+1, I don't do
; anything, but if I need more primes, add them to
; a running list. Example:
; 
; 2 2*
; 3 3*
; 4 2 2*
; 5 5*
; 6 2 3
;
; 6 is the first number that I don't add any primes
; for since I already have one each of 2 and 3.



(define divisors (ints-n-to-m 2 20))



; Count the number of times an atom occurs in a list.
(define (count-in n l)
  (if (null? l)
      0
      (if (= n (car l))
          (+ (count-in n (cdr l)) 1)
          (count-in n (cdr l)))))

; Remove the first occurrence of an item from the list.
(define (delete-first i l)
  (if (null? l)
      '()
      (if (= i (car l))
          (cdr l)
          (cons (car l)
                (delete-first i (cdr l))))))

; Remove all the items in a list from the second list.
(define (delete-list rem keep)
  (if (null? rem)
      keep
      (delete-list (cdr rem)
                   (delete-first (car rem) keep))))



; Function which will tally the prime factors needed
; as you add a number from the range to the list.
(define (all-prime-factors range)
  (if (null? (cdr range))
      (prime-decom (car range))
      (let* ((primes-here
               (prime-decom (car range)))
             (primes-before
               (all-prime-factors (cdr range)))
             (adds
               (delete-list primes-before primes-here)))
        (append primes-before adds))))



; Solve the problem
(apply * (all-prime-factors divisors))
