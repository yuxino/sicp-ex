#lang racket
; 让树变得平滑 输出结果
; 输入 (1 2 (3 (4 5)))
; 输出 (1 2 3 4 5)
(require racket/trace)


; 答案
;  (define (fringe tree) 
;    (define nil '()) 
;    (define (build-fringe x result) 
;      (cond ((null? x) result) 
;            ((not (pair? x)) (cons x result)) 
;            (else (build-fringe (car x)  
;                                (build-fringe (cdr x) result))))) 
;    (build-fringe tree nil)) 


; (fringe (list (list (list 5) 6 7) 2 (cons 3 4)))

; (fringe (list (list (list 5) 6 7) 2 (list 3 4)))