#lang sicp

;;;; This is to define and test numbers to see how small or how big the
;;;; the program can comprehend numbers
(define large-number 1234567891234)
(define small-number  0.0000000123)

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;;;; This has been modified for the exercise
(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.000000001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt small-number)