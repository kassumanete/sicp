#lang sicp

; (define (+ a b)
;   (if (= a 0)
;       b
;       (inc (+ (dec a) b))))

;;; The first one is a recursive process because the final form of the function will be something along the lines of
;;; (inc(inc(inc(inc(...inc(b)))) depending on how many times a will be decremented.

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

;;; The second definition would be an iterative process because in each step, the state of the program is conserved.
;;; After the first recursive call, the definition will call (+ (a-1) (b+1)), then (+ (a-2) (b+2)) ... until a is 0.