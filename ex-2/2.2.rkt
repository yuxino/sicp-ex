#lang racket

; 目标:线段，点，然后算中点。

(define (abs n)
  (
    if (< n 0) (- n) n
  )
)

; 构建线段
(define (make-segment pointA pointB)
  (cons pointA pointB)
)

; 线段起始点
(define (segment-start segment)
  (car segment))

; 线段终点
(define (segment-end segment)
  (cdr segment))

; 构建点
(define (point x y)
  (cons x y))

; 点的x坐标
(define (point-x point)
  (car point))

; 点的y坐标
(define (point-y point)
  (cdr point))

; 计算中点
(define (segment-midpoint segmentA segmentB)
  (
    (
      point
      (/ 2 (+ (point-x (segment-start segmentA)) (point-x (segment-start segmentB))))
      (/ 2 (+ (point-x (segment-end segmentA)) (point-x (segment-end segmentB))))
    )
  ))

(segment-midpoint
  (
    make-segment (point 1 2) (point 2 3)
  )
)