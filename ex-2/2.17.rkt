#lang racket

; 返回只包含给定表里最后一个元素的表
; (last-pair (list 23 72 149 34))
; 34

(define (list-ref items n)
  (
    if (= n 0)
       (car items)
       (list-ref (cdr items) (- n 1))
  )
)

(define (last-pair items)
  (list-ref items (- (length items) 1))
)

(last-pair (list 23 72 149 34 99))