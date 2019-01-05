#lang racket/base

(define (square x)
    (* x x))

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? prev-guess guess)
    (< (/ (abs (- prev-guess guess)) guess) 0.001))
    
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else-clause)))

(define (sqrt-iter guess x) 
  (new-if (good-enough? guess x) 
          guess 
          (sqrt-iter (improve guess x) 
                     x)))

; run into endless loop because racket uses applicative-order evaluation