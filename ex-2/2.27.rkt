#lang racket
; 让树变得平滑 输出结果
; 输入 (1 2 (3 (4 5)))
; 输出 (1 2 3 4 5)
(require racket/trace)

(define (append list1 list2)
  (
    if (null? list1)
    list2
    (
      cons (car list1) 
           (append (cdr list1) list2)
    )
  )
)

; 借助 append 的版本
(define (fringe items)
  (cond 
    ((null? items) '())
    ((not (pair? items)) (list items))
    (else
      (append (fringe (car items))
              (fringe (cdr items))
      )
    )
  )
)

; (1 2 3 7 8 9)
(fringe (list 1 2 3 (list 7 8 9)))
; (5 6 7 2 3 4)
(fringe (list (list (list 5) 6 7) 2 (cons 3 4)))
; (5 6 7 2 3 4)
(fringe (list (list (list 5) 6 7) 2 (list 3 4)))

; 不用 append 的版本
; 噢噢噢 看了答案之后思路就是 当找到值的
; 时候就可以归档了 往上面回退回去 ~

; 看到的答案
;  (define (fringe tree) 
;    (define nil '()) 
;    (define (build-fringe x result) 
;      (cond ((null? x) result) 
;            ((not (pair? x)) (cons x result)) 
;            (else (build-fringe (car x)  
;                                (build-fringe (cdr x) result))))) 
;    (build-fringe tree nil)) 
