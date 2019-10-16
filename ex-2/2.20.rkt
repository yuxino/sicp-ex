#lang racket

; 求出和第一个数字一样奇偶数的集合

(define (same-parity . l)
  (define (iter l p)
    (if (= (length l) 0)
        '() ; 让函数停止且让cons结束
        (if (= ((remainder (car l) 2)) p)
            (cons (car l) (iter (cdr l) p))
            (iter (cdr l) p))))
  (iter l ((remainder (car l) 2))))

(same-parity 1 2 3 4 5 6)