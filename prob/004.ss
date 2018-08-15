(load "util/list.ss")



; Helper: First letter from a string
(define (string-first-letter s)
  (substring s 0 1))

; Helper: Last letter from a string
(define (string-last-letter s)
  (substring s (- (string-length s) 1)
               (string-length s)))

; Helper: Trim the first and last letters
(define (string-trim-ends s)
  (substring s 1 (- (string-length s) 1)))

; Check if a string is a palindrome
(define (palindrome? s)
  (if (or (= (string-length s) 0)
          (= (string-length s) 1))
      #t
      (and (equal? (string-first-letter s)
                   (string-last-letter s))
           (palindrome? (string-trim-ends s)))))

; Check if an integer is a palindrome
(define (palindrome-int? i)
  (palindrome? (number->string i)))



; List of every three digit number.
(define three-digits (reverse (ints-n-to-m 100 999)))

; Make all the pairs.
(define three-pairs (every-dot three-digits three-digits))



; Get all the palindrome numbers.
(define (all-palindromes l)
  (if (null? l)
      '()
      (let ((number (* (caar l) (cdar l))))
        (if (palindrome-int? number)
            (cons number (all-palindromes (cdr l)))
            (all-palindromes (cdr l))))))



; Solve the problem
(max-value (all-palindromes three-pairs))
