#lang racket

;; List of the digits in string form
(define strs (map number->string (range 0 10)))

;; Create the permutations, sorted in lexicographic order
(define strs-lex
  (sort
    (map (lambda (l)
           (foldl string-append "" l))
         (permutations strs))
    string<?))

;; Get the millionth value from the list
(list-ref strs-lex 999999)
