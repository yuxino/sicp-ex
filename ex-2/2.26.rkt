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
 (reverse x) 

 ;; Deep reverse.Same as reverse, but when adding the car to the 
 ;; result, need to check if the car is a list.If so, deep reverse 
 ;; it. 

 ;; First try: 
 (define (deep-reverse items) 
  (define (deep-rev-imp items result) 
      (
        if (null? items) result 
        (
          let ((first (car items)))
          (
            deep-rev-imp (cdr items) 
            (
              cons
               (if (not (pair? first)) first 
                   (deep-reverse first)
               )
               result
            )
          )
        )
      )
  )   
  (deep-rev-imp items nil)
) 

 ;; Usage: 
 (deep-reverse x) 