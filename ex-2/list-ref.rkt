#lang racket

(define (list-ref items n)
  (
    if (= n 0)
       (car items)
       (list-ref (cdr items) (- n 1))
  )
)

(list-ref (list 1 2 3 4) 2)