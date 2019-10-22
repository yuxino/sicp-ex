#lang racket

(define (append list1 list2)
  (
    if (null? list1)
    list2
    (
      cons (car list1) 
           (append (cdr list1) list2)
    )
  )
)

(append (list 1 2 3) (list 4 5 6))