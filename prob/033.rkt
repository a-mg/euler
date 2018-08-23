#lang racket

;; Check if a numerator n and denominator d constitute a
;; `digit cancelling fraction`
;; num < denom
;; num/denom = s(num)/s(denom) where s is a function which
;; removes a shared digit from each number
(define (dcf-pair? num denom)
  ;; Helper, find the shared digit
  (define (shared-digit num denom)
    (let* ([num-str   (number->string num)]
           [denom-str (number->string denom)]
           [num-d1    (substring num-str   0 1)]
           [num-d2    (substring num-str   1 2)]
           [denom-d1  (substring denom-str 0 1)]
           [denom-d2  (substring denom-str 1 2)])
      (cond
        [(or (equal? num-d1 denom-d1)
             (equal? num-d1 denom-d2))
          (string->number num-d1)]
        [(or (equal? num-d2 denom-d1)
             (equal? num-d2 denom-d2))
          (string->number num-d2)]
        [else
          #f])))
  ;; Helper, cancel a digit from a number
  (define (cancel-digit num digit)
    (string->number
      (string-replace (number->string num)
                      (number->string digit)
                      ""
                      #:all? #f)))
  ;; Perform the predicate check
  (let ([cancel (shared-digit num denom)])
    (cond
      [(not cancel) #f]
      [(= 0 cancel) #f]
      [(= 0 (cancel-digit denom cancel)) #f]
      [(>= num denom) #f]
      [else (= (/ num denom)
               (/ (cancel-digit num cancel)
                  (cancel-digit denom cancel)))])))

;; Create a list of all the combinations of two digit numbers
(define all-pairs
  (for*/list ([i (range 10 100)]
              [j (range 10 100)])
    (list i j)))

;; Filter only the pairs that make dcf-pairs
(define dcf-pairs (filter ((curry apply) dcf-pair?) all-pairs))

;; Find the solution
(denominator (apply * (map ((curry apply) /) dcf-pairs)))
