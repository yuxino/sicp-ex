#lang racket

; code blow

; Alyssa 对 1.1.7 写的 if 表示不理解 。 问为什么不用 cond 自己实现一个 if
; 那么如果用自己实现的 if 会发生什么呢 ?

; 解释器抱怨说函数的递归层数太深了，超过了最大的递归深度，它不能处理这样的函数。

; 问题出在 sqrt-iter 函数，如果使用 trace 来跟踪它的调用过程的话，就会发现它执行了大量的递归调用，

; 这些调用数量非常庞大，最终突破解释器的栈深度，造成错误：

; 而另一方面，新定义的 new-if 只是一个普通函数，它没有 if 所具有的特殊形式，根据解释器所使用的应用序求值规则，每个函数的实际参数在传入的时候都会被求值，

; 因此，当使用 new-if 函数时，无论 predicate 是真还是假， then-clause 和 else-clause 两个分支都会被求值。

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
      x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))

; 死循环
; (sqrt 9)

; 一个很简单的例子证明 new-if 被执行了两次

; 常规 if
(if #t (display "good\n") (display "bad"))

; new-if
(new-if #t (display "good") (display "bad"))

; 这就说明了为什么用 new-if 重定义的 sqrt-iter 会出错：因为无论测试结果如何， sqrt-iter 都会一直递归下去。