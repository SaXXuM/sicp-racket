#lang racket/base
(require rackunit)

(define (sum-of-squares a b)
    (+ (* a a) (* b b)))

(define (sum-of-squares-two-biggest a b c)
    (cond ((and (> a c) (> b c)) (sum-of-squares a b))
        ((and (> a b) (> c b)) (sum-of-squares a c))
        (else (sum-of-squares b c))))

(check-equal? (sum-of-squares-two-biggest 2 3 4) 25)
(check-equal? (sum-of-squares-two-biggest 3 2 4) 25)
(check-equal? (sum-of-squares-two-biggest 3 4 2) 25)