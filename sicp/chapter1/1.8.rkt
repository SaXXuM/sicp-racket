#lang racket/base
(require rackunit)

(define (square x)
    (* x x))

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? prev-guess guess)
    (< (/ (abs (- prev-guess guess)) guess) 0.001))

(define (third-root-iter prev-guess guess x)
    (if (good-enough? prev-guess guess)
        guess
        (third-root-iter guess (improve guess x) x)))

(define (third-root x)
    (third-root-iter 0.0 1.0 x))

(check-equal? (real->decimal-string (third-root .000001) 3) "0.010")
(check-equal? (real->decimal-string (third-root 1000) 0) "10.")