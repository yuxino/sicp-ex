#lang racket

; code blow


(define (bigger-sum-of x y z) (
  cond ((and (< x y) (< x z)) (+ y z))
       ((and (< y x) (< y z)) (+ x z))
       (else (+ x y)) 
))

(bigger-sum-of 1 2 3)