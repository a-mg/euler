(load "util/list.ss")



;;; Check if three numbers comprise a Pythagorean triple.
(define (pythag-triple? a b c)
  (= (+ (square a)
        (square b))
     (square c)))

;;; Check if three numbers sum to 1000.
(define (sum-1000? a b c)
  (= (+ a b c) 1000))



;;; All the possible values for c.
(define c-opts (range 3 997))

;;; All the possible values for b given c.
(define (b-opts c)
  (let* ((bound1 (- c 1))
         (bound2 (- 1000 c))
         (end (apply min (list bound1 bound2))))
    (range 2 end)))

;;; All the possible values for a given b, c.
(define (a-opts b c)
  (let* ((bound1 (- b 1))
         (bound2 (- 1000 b))
         (bound3 (- 1000 c))
         (end (apply min (list bound1 bound2 bound3))))
    (range 1 end)))



;;; Loop for a: given b and c, check all the values
;;; of the a list and return any triple that satisfies
;;; both pythag-triple? and sum-1000?.
(define (loop-a as b c)
  (if (null? as)
      '()
      (if (and (pythag-triple? (car as) b c)
               (sum-1000? (car as) b c))
          (list (car as) b c)
          (loop-a (cdr as) b c))))

;;; Loop for b: given c, call loop-a with every
;;; possible value of b.
(define (loop-b bs c)
  (if (null? bs)
      '()
      (let ((option (loop-a (a-opts (car bs) c) (car bs) c)))
        (if (not (null? option))
            option
            (loop-b (cdr bs) c)))))

;;; Loop for c: given a list of cs, call loop-b
;;; with every possible value of c.
(define (loop-c cs)
  (if (null? cs)
      '()
      (let ((option (loop-b (b-opts (car cs)) (car cs))))
        (if (not (null? option))
            option
            (loop-c (cdr cs))))))



;;; Find the Pythagorean triple that satisfies
;;; the problem.
(define triple (loop-c c-opts))

;;; Determine the product of the numbers.
(define product (apply * triple))

;;; Return both.
(list triple product)
