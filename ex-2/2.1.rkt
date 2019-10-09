#lang racket

; 改造。使两个都为负数的时候。只有分子为负数

(define (abs n)
  (
    if (< n 0) (- n) n
  )
)

(define (oneof x y)
  (
    if (and (< 0 x) (< 0 y))
    x (- x)
  )
)

(define (make-rat n d)
  ; n <0 || d <0
  ; n = - n, d = |d|
  (cons (oneof n d) (abs d))
)

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline)
  (newline)
)

(print-rat (make-rat 1 5))
(print-rat (make-rat 1 -5))