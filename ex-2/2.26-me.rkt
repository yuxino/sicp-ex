#lang racket

; 空表
(define empty '())
; 根节点
(define (end? items) (null? items))
; 叶节点
(define (leaf? items) (not (pair? items)))
; 序对
(define (iscons? items) (pair? items))

; 反转列表
(define (reverse list)
  (define (reverse-ret items result)
    (cond
      ; 空表 -> 到尾部了 -> 返回上次累积的结果
      ((end? items) result)
      ; 非序对 -> 值 直接返回
      ((leaf? items) items)
      (else
        (reverse-ret 
          ; 这里在处理余下的部分
          (cdr items)
          ; 这里是固定的部分 累积上次的计算结果 
          (cons (car items) result)
        )
      )
    )
  )
  (reverse-ret list empty)
)

; 反转列表测试用例
; (reverse (list 1 2))

; reverse-tree 简易版本 不做深度转换 ..
(define (reverse-tree tree)
  (define (reverse-tree-iter items result)
    (cond 
      ((end? items) result)
      ((leaf? items) items)
      (else
        (let ([first (car items)])
          ; 这里要么是值 要么是列表
          (pair? first)
          (reverse-tree-iter 
            (reverse-tree (cdr items)) 
            (cons (reverse first) result)
          )
        )
      )
    )
  )
  (reverse-tree-iter tree empty)
)

(reverse-tree (list (list 1 2 (list 3 4)) (list 3 4)))
(reverse-tree (list 1 2 3 4))