#lang racket

; (reverse (list 1 2 3))
; (3 2 1)

(define (reverse list)
  (define (reverse-ret items n)
    (if (= n 1)
      items
      (reverse-ret (cdr items) (- n 1))
    )
  )
  (reverse-ret list (length list))

  ;
  ; (cons (cons 2 3) 1)
)

(reverse (list 1 2 3 4))