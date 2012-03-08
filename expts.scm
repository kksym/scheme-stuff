(define (even n)
  (zero? (remainder n 2)))

(define (square n)
  (* n n))

(define (expt b n)
  (if (zero? n)
    1
    (* b (expt b (- n 1)))))

(define (expt-iter b n accum)
  (if (zero? n)
    accum
    (expt-iter b (- n 1) (* b accum))))

(define (fast-expt b n)
  (cond
    ((zero? n) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

(define (fast-expt-iter b n accum)
  (cond
    ((zero? n) accum)
    ((even? n) (fast-expt-iter b (/ n 2) (* b (square accum))))
    (else (fast-expt-iter b (- n 1) (* b accum)))))

