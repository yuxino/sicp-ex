#lang racket

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+
                (count-leaves (car x))
                (count-leaves (cdr x))
              )
        )
  )
)

(count-leaves (list 1 2 3 4))
(count-leaves (list 1 2 (cons (list 1 2) (list 2 (cons 1 (list 2))))))
(count-leaves (list 1 2 (list 2 (cons 2 4))))