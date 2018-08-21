#lang racket

(provide number->list
         number->text)



;;; Converts a number into a list of digits.
(define (number->list n)
  (map string->number
       (map string
            (string->list
              (number->string
                n)))))



;;; Association lists to help with recursive base cases
;;; of number->text conversion.
(define triple-separators
  '((1 "")
    (2  " thousand")
    (3  " million")
    (4  " billion")
    (5  " trillion")
    (6  " quadrillion")
    (7  " quintillion")
    (8  " sextillion")
    (9  " septillion")
    (10 " octillion")
    (11 " nonillion")
    (12 " decillion")))

(define digit-ones
  '((0 "zero")
    (1 "one")
    (2 "two")
    (3 "three")
    (4 "four")
    (5 "five")
    (6 "six")
    (7 "seven")
    (8 "eight")
    (9 "nine")))

(define digit-tens
  '((10 "ten")
    (11 "eleven")
    (12 "twelve")
    (13 "thirteen")
    (14 "fourteen")
    (15 "fifteen")
    (16 "sixteen")
    (17 "seventeen")
    (18 "eighteen")
    (19 "nineteen")
    (20 "twenty")
    (30 "thirty")
    (40 "forty")
    (50 "fifty")
    (60 "sixty")
    (70 "seventy")
    (80 "eighty")
    (90 "ninety")))

;;; Given an integer, split into a list of triples (right-biased
;;; so that any excess will exist on the left side).
;;; 1,234,567 -> '(1 234 567)
(define (triple-split-number n)
  ;; Helper, get the first three atoms from a list.
  (define (first-3 l)
    (list (first l)
          (second l)
          (third l)))
  ;; Helper, given a list of strings, group every three strings
  ;; into one and make a new list of the triples.
  (define (group-triples strings)
    (if (<= (length strings) 3)
      (list (foldl string-append "" strings))
      (cons (foldl string-append "" (first-3 strings))
            (group-triples (cdddr strings)))))
  ;;; Perform the grouping.
  (reverse 
    (map string->number
         (group-triples
           (reverse
             (map string
                  (string->list
                    (number->string
                      n))))))))

;;; Converts a number (with a maximum of three digits) to a text-
;;; based representation.
(define (small-number->text n)
  ; Helper, find the base-10 log of a number.
  (define (log10 n)
    (/ (log n) (log 10)))
  ;; Helper, find the number of digits in an integer.
  (define (digits n)
    (if (= n 0)
      1
      (+ 1 (floor (log10 n)))))
  ;; Perform the conversion.
  (cond [(= 1 (digits n))
          ;; For a one digit number, return the string representation
          ;; that already exists in digit-ones.
         (cadr (assoc n digit-ones))]
        [(= 2 (digits n))
          ;; A two digit number either already has a text representation
          ;; or needs to be composed of a tens place and the recursive
          ;; representation of the rest of the number.
          (if (assoc n digit-tens)
            (cadr (assoc n digit-tens))
            (let* ([rest (modulo n 10)]
                   [tens (- n rest)])
              (string-append (cadr (assoc tens digit-tens))
                             "-"
                             (small-number->text rest))))]
        [(= 3 (digits n))
          ;; For a three digit number, add the text representation
          ;; of the hundreds place, and then recursively append the
          ;; string representation of the rest of the number.
          (let* ([rest     (modulo n 100)]
                 [hundreds (/ (- n rest) 100)])
            (string-append (cadr (assoc hundreds digit-ones))
                           " hundred"
                           (if (> rest 0)
                             (string-append " and "
                                            (small-number->text rest))
                             "")))]))

;;; Joins a list of strings together with a separator chosen
;;; from triple-names based on the length of the list.
(define (join-triples sstring llist)
  (if (null? llist)
      ;; The recursion has finished.
      sstring
      (if (and (equal? "zero" (car llist))
               (or (< 1 (length llist))
                   (< 0 (string-length sstring))))
          ;; If there is a zero before the end of the list, or
          ;; there is a zero when there is already text in the
          ;; string, skip the current group.
          (join-triples sstring (cdr llist))
          ;; Otherwise, we need to add the current group to the
          ;; text string and continue on.
          (let ([new-sstring
                  (string-append
                    ;; Add the text so far.
                    sstring
                    ;; Check if we need a comma to divide the groups.
                    (if (< 0 (string-length sstring))
                        ", "
                        "")
                    ;; Add the current number.
                    (car llist)
                    ;; Add the group name.
                    (cadr (assoc (length llist) triple-separators)))])
            ;; Continue with the next group.
            (join-triples new-sstring (cdr llist))))))

;;; Converts a number to a text-based representation by splitting
;;; into triples, getting the text representation for each triple,
;;; and then joining them.
(define (number->text n)
  (join-triples ""
    (map small-number->text
         (triple-split-number n))))
