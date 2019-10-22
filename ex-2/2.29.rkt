; #lang racket

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