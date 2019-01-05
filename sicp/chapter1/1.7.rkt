#lang racket/base
(require rackunit)

(define (square x)
    (* x x))

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? prev-guess guess)
    (< (/ (abs (- prev-guess guess)) guess) 0.001))

(define (sqrt-iter prev-guess guess x)
    (if (good-enough? prev-guess guess)
        guess
        (sqrt-iter guess (improve guess x)
            x)))

(define (sqrt x)
    (sqrt-iter 0.0 1.0 x))

(check-equal? (real->decimal-string (sqrt .0001) 3) "0.010")
(check-equal? (real->decimal-string (sqrt 100000000000000000000) 0) "10000000000.")