#lang racket

; 翻转树

(define (reverse l)
  (define (iter l l0)
    (if (= (length l) 0)
        l0
        (iter (cdr l) (cons (car l) l0))))
  (iter l '()))

(define (fuck-pair items)
  (cond
    ((not (pair? items)) items)
    (else (reverse items))
  )
)

(define (reverse-tree items)
  'EOF
)

; (reverse-tree (cons (list 1 2) (list 3 4)))

; (reverse-tree (list 1))

; (reverse-tree (list 3 4))

(reverse-tree (cons (list 1) (list 2)))

; (cons (list 1 2) (list 3 4))