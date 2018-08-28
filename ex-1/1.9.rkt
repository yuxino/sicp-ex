#lang racket

; code blow

; 照书里面写 + 会死循环 , 不知道是不是
; racket 的原因 ... 所以函数名改为了plus
; 下面分别是自增 自减函数

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

; 运行下列过程
; (plus 3 5)
; 执行轨迹 
; (inc (plus 2 5))
; (inc (inc (plus 2 5)))
; (inc (inc (inc (plus 1 5))))
; (inc (inc (inc 5)))
; (inc (inc 6))
; (inc 7)
; 8
; 这是一个 `线性递归计算过程`

(define (plus a b)
    (if (= a 0)
        b
        (inc (plus (dec a) b))))

; 运行下列过程
; (plus 3 5)
; 执行轨迹
; (plus 2 6)
; (plus 1 7)
; (plus 0 8)
; 8
; 这是一个 `线性迭代计算过程`

; (define (plus a b)
;   (if (= a 0) 
;       b
;       (plus (dec a) (inc b))))

(plus 3 5)