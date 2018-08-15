;;;; date.ss
;;;; Provides utility functions for working with dates.



;;; Given a date in the form year, month, day, calculate
;;; the day of the week (given as a lowercase English string).
;;; (uses the Zeller's congruence algorithm)
(define (day-of-week year month day)
  (let* ((mmonth
           ;; Increase the month by 12 in January and
           ;; February (treat as part of the previous year).
           (if (< month 3)
               (+ month 12)
               month))
         (yyear
           ;; In January and February, use the previous year.
           (if (>= mmonth 13)
               (- year 1)
               year))
         (dday
           ;; Day does not change, but copy into a new variable
           ;; for semantic consistency.
           day)
         (weekday
           ;; Calculate the weekday.
           (inexact->exact
             (modulo (+ dday
                        (floor (/ (* 13. (+ mmonth 1.)) 5.))
                        yyear
                        (floor (/ yyear 4.))
                        (- (floor (/ yyear 100.)))
                        (floor (/ yyear 400.)))
                     7)))
         (weekday-names
           ;; An association list converting days of the
           ;; week as integer values to strings.
           '((2 "monday")
             (3 "tuesday")
             (4 "wednesday")
             (5 "thursday")
             (6 "friday")
             (0 "saturday")
             (1 "sunday"))))
    (cadr (assoc weekday weekday-names))))
