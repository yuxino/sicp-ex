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

; reverse-tree 深度翻转
(define (reverse-tree tree)
  (define (reverse-tree-iter items result)
    (cond 
      ((end? items) result)
      (else
        (let ([first (car items)])
          ; 判断是否为叶子节点, 此时不存在 下一个元素
          (cond 
            (
              (leaf? first)
              ; 如果是叶子节点我们把它归档成列表
              ; 指向上一个值的列表
              ; 此时是叶子 说明ok了 我们可以填 result 了
              (
                reverse-tree-iter  
                (cdr items)
                (cons first result)
              )
            )
            ; 不是叶子 那么只可能是序对了 如果是序对还得在做一次深度的递归
            ; 拼接上次的计算结果。 然后再次计算树节点
            (else
              (cons
                ; 处理序对有空再想吧 ~
                ; 虽然是很奇怪的想法来着
                (reverse-tree first)
                result
              )
            )
          )
        )
      )
    )
  )
  (reverse-tree-iter tree empty)
)

(reverse-tree (list 1 2 (list 3 (list 4 5))))
; (reverse-tree (list 1 2 (list 3 (cons 4 5))))