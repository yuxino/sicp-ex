#lang racket
; 让树变得平滑 输出结果
; 输入 (1 2 (3 (4 5)))
; 输出 (1 2 3 4 5)
(require racket/trace)

(define (fringe items)
  (define (find-item items res)
    (cond 
      ((null? items) res)
      ((not (pair? items)) items)
      (else 
        (find-item (cdr items) (car items))
      )
    )
  )

  (define (fringe-ret items res)
    (cond 
      ; 右半边的返回值
      ((null? items) res)
      (
        else
        (cons
          (
            ; 当找到最左边的值
            if 
            (not (pair? items))
            items
            (fringe-ret (car items) 
              (cons (fringe-ret (cdr items) (cdr items)) res)
            )
          )
          ; 最终的右半边
          res
        )
      )
    )
  )

  ; (trace fringe-ret)
  (fringe-ret items '())
)


(fringe (list (list (list 5) 6 7) 2 (list 3 4)))