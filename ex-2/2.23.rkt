; 实现一个 for-each 过程

#lang racket

(define (for-each proc items)
  (if (null? items)
    '_
    (begin
      (proc (car items))
      (for-each proc (cdr items))
    )
  )
)

(for-each
  (lambda (x) (newline) (display x))
  (list 1 2 3 4 5 6)
)