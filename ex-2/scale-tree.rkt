#lang racket

(define (scale-tree tree factor)
  (cond 
    ((null? tree) '())
    ((not (pair? tree)) (* tree factor))
    (else
      (cons 
        (scale-tree (car tree) factor)
        (scale-tree (cdr tree) factor)
      )
    )
  )
)

(scale-tree (list 1 (list 2 3)) 3)