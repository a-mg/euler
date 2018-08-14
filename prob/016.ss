(load "util/list.ss")
(reduce-left + 0 (number->list (expt 2 1000)))
