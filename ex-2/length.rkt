#lang racket

(define (len items)
  (define (_length items n)
    (
      if (null? items)
        n
        (
          _length (cdr items) (+ n 1)
        )
    )
  )
  (_length items 0)
)

(len (list 1 2 3 4 5))