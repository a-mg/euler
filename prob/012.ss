(load "util/primes.ss")



;;; 'Climbs' the triangle numbers (beginning from 1) and stops
;;; once one is found with more than 500 factors.
(define (climb-triangles i tri)
  (let ((next-tri (+ tri i))
        (next-i   (+ i 1)))
    (if (< 500 (+ 1 (length (factors next-tri))))
        ;; Have found the solution, return it.
        next-tri
        ;; Otherwise, continue.
        (climb-triangles next-i next-tri))))

;;; Start the function from the first triangle number.
(climb-triangles 1 1)
