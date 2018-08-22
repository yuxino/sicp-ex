#lang racket

; code blow

; 返回其中较大的两个数的平方和

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (bigger x y)
    (if (> x y)
        x
        y))

(define (smaller x y)
    (if (> x y)
        y
        x))

(define (bigger-sum-of-squares x y z)
    (sum-of-squares (bigger x y)
                    (bigger (smaller x y) z)))

(bigger-sum-of-squares 1 2 3)