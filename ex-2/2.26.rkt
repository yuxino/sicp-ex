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

 ;; Usage: 
  ; (reverse x) 
  ; (reverse (list (list 1 2 (list 3 4)) (cons 5 6)))

 ;; Deep reverse.Same as reverse, but when adding the car to the 
 ;; result, need to check if the car is a list.If so, deep reverse 
 ;; it. 

 (define (deep-reverse lst) 
   (cond ((null? lst) nil) 
         ((pair? (car lst)) 
          (append 
           (deep-reverse (cdr lst)) 
           (list (deep-reverse (car lst))))) 
         (else 
          (append 
           (deep-reverse (cdr lst)) 
           (list (car lst)))))) 


(list 1 2 (list 3 (list 4 5)))

 (deep-reverse (list 1 2 (list 3 4)))
;  (deep-reverse (list 1 2 (list 3 (list 4 5))))