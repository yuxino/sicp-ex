#lang racket

(define one-through-four (list 1 2 3 4 5 6))

(car one-through-four)

(car (cdr one-through-four))

; equal ⬆️
(cadr one-through-four)