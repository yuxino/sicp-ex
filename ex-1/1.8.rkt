#lang racket

; code blow

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x) 
  (if (good-enough? guess x) 
      guess
      (cube-root-iter (improve guess x)
                      x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x))
     0.001))

(define (improve guess x) 
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

; 平凡根
(define (square x) (* x x))

; 立方根
(define (cube x)
  (* x x x))

(cube-root (* 3 3 3))

(cube-root (* 5 5 5))

(cube-root (* 7 7 7))