#lang racket

; code blow

; 不停的判断这个数字是否足够好。如果是的话就反回
; 否则的话不停的猜测获取更好的数字 然后进行递归
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
      x)))

; 获取一个更好的猜测数的方法是
; ((x / guess) + guess)) / 2
(define (improve guess x)
  (average guess (/ x guess)))

; 求平均值
(define (average x y)
  (/ (+ x y) 2))

; `猜测数字`和`求根数字`的绝对值的差值为 0.001
; 我们就认为他足够好 算是合格的平方根
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; 求平方根 每次以 1.0 作为初始的猜测值
(define (sqrt x)
  (sqrt-iter 1.0 x))

; 求平方
(define (square x)
  (* x x))

(sqrt 9)

(sqrt (+ 100 37))

(sqrt (+ (sqrt 2) (sqrt 3)))

(square (sqrt 1000))