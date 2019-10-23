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
;; 平衡尼玛不会!
(define (balanced mobile)

  ;; 这里算总和
  ;; 有两种可能。
  ;; 第一种 普通分支
  ;; 第二种 二叉体 (mobile)
  ;; 定义来说 普通分支乘积 = 分支长度 * 总量
  ;; 定义来说 二叉体乘积 = 二叉体的长度 * (某个量/某个二叉体的和)
  ;; 左右分支 又同时可能是二叉体或者普通分支

  ;; 脑补的普通分支处理
  ;; length * weight
  (define (torque branch)
    (* (branch-length branch) (branch-structure branch))
  )

  ;; 那么问题是 什么叫做普通 ?
  ;; 一个右边不为二叉体的分支我们视为是一个单纯的普通分支
  (define (isMobile? branch)
    (and
      (list? branch)
      (
        not (pair? (left-branch branch))
      )
      (
        list? (right-branch branch)
      )
    )
  )

  ;; 那也就是说普通分支就是 (not (isMobile? branch))
  ;; 也就是说如果满足这个条件会执行 "torque"
  ;; 那么好 现在是一个二叉分支怎么做呢 ?
  ;; 根据前面的理解
  ;; 二叉体乘积 = 二叉体的长度 * (左右分支的和)
  ;; 在这里。我们如果想计算二叉体的总和。
  ;; 那么会有 count = (length mobile) * (?)
  ;; 左右分支总和 = count = 乘积(左边分支) + 乘积(右边分支)
  ;; 二叉体的总和 = (length mobile) * count

  (define (count branch)
    (
      +
      (calc (left-branch branch))
      (calc (right-branch branch))
    )
  )

  ; 现在变得简单了起来 
  ; 要么是普通要么是二叉 二叉就进入下一步
  ; 要么是值
  (define (calc branch)
    (if (isMobile? branch)
      (
        *
        (branch-length branch)
        (count (cadr branch))
      )
      (torque branch)
    )
  )

  ;; 计算测试用例
  ; ;; 普通分支 15
  ; (display (calc (make-branch 3 5)))
  ; (newline)
  ; ;; 分支二叉体 60
  ; (display 
  ;   (calc    
  ;     (
  ;       make-branch 3 
  ;       (make-mobile
  ;         (make-branch 1 10)
  ;         (make-branch 1 10)
  ;       )
  ;     )
  ;   )
  ; )
  ; (newline)
  ; ;; 复杂分支 150
  ; (display 
  ;   (calc
  ;     ;; 150
  ;     (
  ;       make-branch 3 
  ;       ;; 50
  ;       (make-mobile
  ;         ;; 10
  ;         (make-branch 1 10)
  ;         ;; 40
  ;         (make-branch 2
  ;           ;; 20
  ;           (make-mobile
  ;             (make-branch 1 10)
  ;             (make-branch 1 10)
  ;           ) 
  ;         )
  ;       )
  ;     )
  ;   )
  ; )
  ; (newline)

  ; 这里是比较公式
  (if ( = (calc (left-branch mobile))
          (calc (right-branch mobile)))
    "yes !!!"
    "no ~~~"
  )
)

(balanced mobile)