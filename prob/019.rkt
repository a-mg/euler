#lang racket

(require racket/date
         "../util/list.rkt")

;;; Calculates the weekday (0=Sunday) from a specified
;;; day, month, and year.
(define (weekday year month day)
  (date-week-day
    (seconds->date
      (find-seconds 00 00 00 day month year))))

;;; Make a list containing every date of the twentieth century
;;; in the format '(year month day).
(define (all-dates)
  ;; Helper, append the day (first day of month)
  (define (append-day l)
    (append l '(1)))
  ;; Create the list of dates
  (map append-day (pair-off (range 1901 2001)
                            (range 1 13))))

;; Solve the problem
(count zero? (map ((curry apply) weekday) (all-dates)))
