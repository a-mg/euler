(load "util/date.ss")



(count (lambda (l)
         (equal? l "sunday"))
       (map (lambda (l)
              (day-of-week (car l) (cdr l) 1))
            (every-dot (iota 100 1901)
                       (iota 12 1))))
