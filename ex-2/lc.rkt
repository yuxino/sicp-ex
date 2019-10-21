#lang racket

; difference between list and cons
; (cons 1 2) = (1.2)
; (list 1 2) = (1 2)
; (list 1 2) = (cons 1 (cons 2 ()))

(display (list 1 2))
(newline)
(display (cons 1 2))
(newline)
(display (cons 1 (cons 2 '())))
(newline)
(display (list 1 2 (list 3 4)))
(newline)
(display (list 1 2 (cons 3 (cons 4 '()))))
(newline)