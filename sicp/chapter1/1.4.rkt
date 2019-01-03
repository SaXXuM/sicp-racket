#lang racket/base
(require rackunit)

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 9 1) 10)
; ((if (> 1 0) + -) 9 1)
; ((if #t + -) 9 1))
; (+ 9 1)
; 10

(check-equal? (a-plus-abs-b 9 -1) 10)
; ((if (> -1 0) + -) 9 -1)
; ((if #f + -) 9 -1))
; (- 9 -1)
; 10
