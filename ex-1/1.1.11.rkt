#lang racket

;;; 递归版本
(define (f n)
    (if (< n 3)
        3
        (+
          (f (- n 1))
          (* 2 (f (- n 2)))
          (* 3 (f (- n 3)))
        )
      ))

;;; TODO: 迭代版本

(f 4)