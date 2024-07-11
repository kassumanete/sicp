#lang sicp

; Below is the Ackermann's function defined in the book
(define (A x y)
  (cond((= y 0) 0)
       ((= x 0) (* 2 y))
       ((= y 1) 2)
       (else (A (- x 1) (A x (- y 1))))))
      
; We'll try to evaluate the given expressions in order
(A 1 10)  ;1024
(A 2 4)   ;65536
(A 3 3)   ;65536

; Concise mathematical defintions of the functions below
; where n is a positive integer

; (define (f n)(A 0 n))
; From the definition of A, we can see that whenever x = 0, the function will always return (* 2 y),
; hence f(n) = 2n

; (define (g n)(A 1 n))
; Expanding the Ackermann's function for the above definition,
; (A 0 (A 1 (n-1))
; The above definition can be written as g(n) = f(g(n-1)) = 2[g(n-1)],
; continuing this you get f(g(n-2)) = 2*2[g(n-2)]. The recursion keeps going until until f(g(1)),
; resulting in  g(n) = 2^n

; (define (h n)(A 2 n))
; Expanding the Ackermann's function for the above definition,
; (A 1 (A 2 (n-1)))
; using the same method of substitution above, h(n) = g[ h(n-1) ] = 2^(h(n-1)),
; continuing the recursion will result in h(n) = 2^^n (tetration operator)

;(define (k n) (* 5 n n))
; k(n) = 5(n^2)