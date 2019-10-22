#lang racket

; 翻转树 标准答案
; http://community.schemewiki.org/?sicp-ex-2.27

 ;; A value for testing. 
 (define x (list (list 1 (list 2 1)) (list 3 4)))

 ;; My environment doesn't have nil. 
 (define nil '()) 

 ;; Here's reverse for reference: 
 (define (reverse items) 
   (define (rev-imp items result) 
     (if 
        (null? items) result 
        (rev-imp (cdr items) (cons (car items) result))
     )
   )
   (rev-imp items nil)
)

(define (append list1 list2)
  (
    if (null? list1)
    list2
    (
      cons (car list1) (append (cdr list1) list2)
    )
  )
)

(define (deep-reverse li) 
  (cond 
    ((null? li) '()) 
    ; 匹配到值  -> 结束
    ((not (pair? li)) li) 
    ; 只处理列表 (这边不处理序对的情况)
    ; 因为当是序对的时候 要考虑特殊情况
    ; 如果是序对的话
    ; append 左值将不是列表。
    ; 但是如果你让他强行变成列表又会出现新的问题 ...
    ; 会变的死循环
    ; 感觉有点儿无解 ....
    (else 
      (append 
        ; 右边
        (deep-reverse (cdr li))  
        ; 左边归档成列表
        (list (deep-reverse (car li)))
      )
    )
  )
)

 (deep-reverse (list 1 2))
;  (deep-reverse (list 1 2 (list 3 4)))
;  (deep-reverse (list 1 (cons 2 3)))

; (car (cdr (cons 1 2)))