#lang racket

; code blow
(require racket/trace)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(trace A)

(A 1 -1)
;;; (A 2 4)
;;; (A 3 3)

;;; 求解以下数学定义

;;; (define (f n) (A 0 n)) = 2n
;;; (define (g n) (A 1 n)) = 2^n
;;; (define (h n) (A 2 n)) = ?