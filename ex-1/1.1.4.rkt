#lang racket

; code blow
; lisp 允许把过程(函数)作为返回值使用

(define (a-plus-abs-b a b) 
  ((if (> b 0) + -) a b))

(a-plus-abs-b 2 -2)