#lang racket/base
(require rackunit)

(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) 
                (A x (- y 1))))))

(check-equal? (A 9 0) 0)
(check-equal? (A 0 9) 18)
(check-equal? (A 0 1) 2)
(check-equal? (A 1 2) 4)

; (A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; (A 0 (A 0 ... (A 0 (A 0 1) ... ))
; (A 0 (A 0 ... (A 0 2) ... ))
(check-equal? (A 1 10) 1024)

; (A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4))
; (A 1 (A 0 (A 1 3)))
; (A 1 (A 0 8))
; (A 1 16)
; (A 0 (A 1 15))
; (A 0 32768)
; 65536
(check-equal? (A 2 4) 65536)

; (A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 (A 1 (A 2 1)))
; (A 2 (A 1 2))
; (A 2 (A 0 (A 1 1)))
; (A 2 (A 0 2))
; (A 2 4)
; 65536
(check-equal? (A 3 3) 65536)

(define (f n) (A 0 n))
; f(n) = 2 * n, n > 0
; f(0) = 0

(define (g n) (A 1 n))
; g(n) = 2 ^ n, n > 0
; g(0) = 0

(define (h n) (A 2 n))
; h(n) = 2 ^ h(n - 1) = g(h(n - 1)), n > 1
; h(1) = 2
; h(0) = 0
; h(4) = g(h(3)) = g(g(h(2))) = g(g(g(h(1)))) = 2 ^ (2 ^ (2 ^ 2))
