#lang sicp

; f is defined as followed
; f(n) = n if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >=3

; Recursive process

(define (f-recurse n)
    (if (< n 3)
        n 
        (+ 
            (f-recurse (- n 1))
            (* 2 (f-recurse (- n 2)))
            (* 3 (f-recurse (- n 3))))))

; Iterative process

(define (f-iter n)
(f-iter-implement 0 1 2 n))

; Define the iterative implementation below, noticing that we need to pass 3 values along with the
; count that is needed.
(define (f-iter-implement minusthree minustwo minusone count)
    (define current (+ (* 3 minusthree) (* 2 minustwo) minusone))
    (cond 
        ((< count 3) count)
        ((= count 3) current)
        (else (f-iter-implement minustwo minusone current (- count 1)))))


; manual check until n = 5
(define (correct? n expected)
    (define recurse-result (f-recurse n))
    (define iter-result (f-iter n))
    (cond
        ((and (equal? expected iter-result) (equal? expected recurse-result)) 
            (string-append "pass expected: " (number->string expected) " n: " (number->string n)))
        ((equal? expected iter-result) 
            (string-append "recurse error: " (number->string iter-result) " expected: " (number->string expected)) " n: " (number->string n))
        (else 
            (string-append "iter error: " (number->string iter-result) " expected: " (number->string expected) " n: " (number->string n)))
        ))

(correct? -10 -10)
(correct? 0 0)
(correct? 1 1)
(correct? 2 2)
; 2 + (2*1) + (3*0) = 4
(correct? 3 4)
; 4 + (2*2) + (3*1) = 11
(correct? 4 11)
; 11 + (2*4) + (3*2) = 25
(correct? 5 25)

; Do a check to ensure the values returned are the same.

(= (f-recurse 1) (f-iter 1))
(= (f-recurse -10) (f-iter -10))
(= (f-recurse 5) (f-iter 5))
(= (f-recurse 10) (f-iter 10))