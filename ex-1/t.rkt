#lang racket

; code blow

(define (square x)
  (* x x)
)

(define (sum-of-squares x y)
  (
    + (square x) (square y)
  )
)

(define (f a)
  (
    sum-of-squares (+ a 1) (* a 2)
  )
)

(define 
  (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))
  )
)

; another implements
; (define (abs x)
;   (if (< x 0) (- x) x)
; )

(define (qaq z c) (< z 5))

(define (a x y)
  (if (qaq x y) 2 3)
)

(a 0 2)