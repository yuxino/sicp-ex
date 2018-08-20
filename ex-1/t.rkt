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

(abs 15)