(use srfi-1)

; (+ (/ (/ (* 1 10) 1) 1) (/ 6 1)) ==> (+ 10 6)

;; NOTE: this only works with s-expressions in the form:
;;  (OPERATION OPERAND1 OPERAND2)
;;  ie. (/ 2 1), (* 1 x)

(define (rules expr)
  (case (car expr)
    ((/) (if (eq? (caddr expr) 1)
           (cadr expr)
           expr))
    ((*) (cond
           ((eq? (cadr expr) 1) (caddr expr))
           ((eq? (caddr expr) 1) (cadr expr))
           (else expr)))))

;; TODO: edit this to avoid state mutation of ACCUM with APPEND!
;; TODO: clean up 
(define accum '())

(define (id-simplify expr last)
  (let ((func (lambda ()
                (map (lambda (x)
                       (if (list? x)
                         (append! accum (rules x))
                         x)) expr))))
    (let loop ((result (func))
               (lastresult '()))
      (if (equal? result last)
        result
        (id-simplify result result)))))

