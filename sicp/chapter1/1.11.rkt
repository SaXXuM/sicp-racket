#lang racket/base
(require rackunit)

(define (f-recursive n)
  (if (< n 3) n
    (+ (f-recursive (- n 1)) (f-recursive (- n 2)) (f-recursive (- n 3)))))

(define (f-iter n)
  (define (iter 1st 2nd 3rd count)
    (if (= count n) (+ 1st 2nd 3rd)
      (iter (+ 1st 2nd 3rd) 1st 2nd (+ count 1))))

  (if (< n 3) n
    (iter 2 1 0 3)))

(check-equal? (f-recursive 1) 1)
(check-equal? (f-recursive 2) 2)
(check-equal? (f-recursive 3) 3)
(check-equal? (f-recursive 10) 230)
(check-equal? (f-recursive 20) 101902)
(check-equal? (f-iter 1) 1)
(check-equal? (f-iter 2) 2)
(check-equal? (f-iter 3) 3)
(check-equal? (f-iter 10) 230)
(check-equal? (f-iter 20) 101902)

 