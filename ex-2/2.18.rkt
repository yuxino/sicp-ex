#lang racket

; 我实现的。。。
(define (list-ref items n)
  (
    if (= n 1)
       (car items)
       (list-ref (cdr items) (- n 1))
  )
)

(define (reverse list)
  (define (reverse-iter items n l)
    (if (= (- l n) 1)
      (cons (list-ref items 1) '())
      (cons (
        list-ref items (- l n))
        (reverse-iter items (+ n 1) l)
      )
    )
  )
  (reverse-iter list 0 (length list))
)

; 草 别人写的
; (define (reverse l)
;   (define (iter l l0)
;     (if (= (length l) 0)
;         l0
;         (iter (cdr l) (cons (car l) l0))))
;   (iter l '()))

(reverse (list 1 2 3 4))
(reverse (list 4 3 2 1))