#lang racket/base

(define (p) (p))

(define (test x y)
    (if (= x 0)
        0
        y))

; (test 0 (p))

; applicative-order evaluation never terminate 
; because interpreter must calculate value of second argument first

; normal-order evaluation
; (if (= x 0) 0 (p)))
; (if #t 0 (p)))
; 0
