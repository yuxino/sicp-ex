#lang racket
; 让树变得平滑 输出结果
; 输入 (1 2 (3 (4 5)))
; 输出 (1 2 3 4 5)

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

  ; res 记录的是最后一个值 对应 cons 的
  (define (left items res)
    (cond
      ((null? items) res)
      ((not (pair? items)) items)
      (else 
        (left
          ; 结束表达式
          (if (pair? items) (car items) '())
          (if (pair? items) items (car items))
        )
      )
    )
  )
  
  (define (fringe-ret items)
    (cons
      (left items '())
      'EOF
    )
  )
  
  (fringe-ret items)
)

(fringe (list (list (list 5) 6 7) 2 (list 3 4)))