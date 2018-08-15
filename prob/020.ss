(load "util/probability.ss")
(load "util/list.ss")



(reduce-left + 0 (number->list (factorial 100)))
