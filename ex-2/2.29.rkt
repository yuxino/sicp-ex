#lang racket

;; 二叉活动体。大概就是一个傻逼玩意。
;; 一个简单的列表，有左右两边。
;; 两边的值可以是一个真实的值例如数值
;; 也可以又嵌套一个二叉活动体。

(define (make-mobile left right)
  (list left right)  
)

;; 分支 长度是杆子的长度
;; structure 可以是数字表示重量 也可以继续是一个活动体
;; 例如 mobile
(define (make-branch length structure)
  (list length structure)
)

;; 取左分支
(define (left-branch mobile)
  (car mobile)
)

;; 取右分支
(define (right-branch mobile)
  (cadr mobile)
)

;; 左右分支测试
; (left-branch (make-mobile 1 2))
; (right-branch (make-mobile 1 2))

;; 取出分支上的长度
(define (branch-length branch)
  (left-branch branch)
)

;; 取出分支上的成分 (除长度以外的那部分吧) 
(define (branch-structure branch)
  (right-branch branch)
)

;; 算总重量
(define (total-weight mobile)
  
  (define (walk mobile acc)
    (iter
      (branch-structure 
        (left-branch mobile)
      )
      (
        iter
        (branch-structure 
          (right-branch mobile)
        )
        acc
      )
    )
  )

  (define (iter structure acc)
    (cond 
      ((list? structure) 
        (walk structure acc)
      )
      ((not (pair? structure)) (+ acc structure))
    )
  )

  (walk mobile 0)
)

;; 更简洁的答案
; (define (total-weight mobile) 
;    (cond ((null? mobile) 0) 
;          ((not (pair? mobile)) mobile) 
;          (else (+ (total-weight (branch-structure (left-branch mobile))) 
;                   (total-weight (branch-structure (right-branch mobile)))))))

(
  define 
  mobile 
  (make-mobile
    (make-branch 5 6)
    (make-branch 3 
      (make-mobile
        (make-branch 1 10)
        (make-branch 1 10)
      )
    )
  )
)

;; 总重量 test case
; (total-weight mobile)

;; 判断是否平衡
;; balanced?

; 首先得是序对其次再取右分支
(define (isMobile? branch)
  (and 
    (pair? branch)
    (pair? (branch-structure branch))
  )
)

; 如果不是 mobile 开始计算值。
; 取长度, 取重量。这部分是 acc

(define (torque branch)
  (* (branch-length branch) (branch-structure branch))
)

; 配尼玛呢配 不会!
(define (balanced mobile)
  ; 这里算总和
  (define (iter branch acc)
    (
      cond 
      ; ((null? branch) acc)
      ; 不管是左边还是右边都需要计算两边的和
      ; 检查如果右边是 mobile 继续递归
      ; (isMobile? (right-branch mobile))
      (else 
        (let
          (
            ; 长度
            [left (left-branch branch)]
            ; 右半边
            [right (right-branch branch)]
          )
          ; 如果右半边还是有东西
          ; 如果右半边是值 直接计算出结果
          (if (isMobile? right)
            ; 最小分支的值也是上次计算出来的结果
            (+ (torque branch) acc)
          )
        )
      )
    )
  )

  (display "left:")
  (display (iter (left-branch mobile) 0))
  (display "\tright:")
  (display (iter (right-branch mobile) 0))
  (newline)
  
  #f
)

(balanced mobile)