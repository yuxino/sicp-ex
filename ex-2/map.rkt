#lang racket

(define (map proc items)
  (if (null? items)
    items
    (cons
      (proc (car items))
      (map proc (cdr items))
    )
  )
)

(map (lambda (x) (* x x)) (list 1 2 3 4))