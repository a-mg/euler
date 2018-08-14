(load "util/number.ss")



;;; Function deletes the specified list of characters
;;; from a string.
(define (delete-chars str chars)
  (reduce-left string-append ""
    (remove (lambda (l) (member l chars))
      (map char->string
        (string->list str)))))

;;; Solve the problem
(reduce-left + 0
  (map string-length
    (map (lambda (l) (delete-chars l '("-" "," " ")))
      (map number->text
        (iota 1000 1)))))
