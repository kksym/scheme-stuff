(use srfi-1)

(define rules '())

(define-syntax define-rule
  (syntax-rules ()
    ((_ (OP . EXPR) BODY ...)
     (set! rules (append rules (list (cons (quote OP) (lambda EXPR BODY ...))))))))

(define (identity x) x)

(define (lookup-rule sym)
  (let ((rule (assq sym rules)))
    (if rule
      (cdr rule)
      identity)))

(define (apply-rule expr)
  (if (list? expr)
    ((lookup-rule (car expr)) expr)
    expr))

;; RULE DEFINITIONS

(define-rule (/ expr) 
  (cond
    ((eq? (caddr expr) 1) (cadr expr)) ; X / 1 = X
    ((eq? (cadr expr) (caddr expr)) 1) ; X / X = 1
    (else expr)))

(define-rule (* expr) 
  (cond
    ((eq? (cadr expr) 1) (caddr expr)) ; 1 * X = X
    ((eq? (caddr expr) 1) (cadr expr)) ; X * 1 = X
    (else expr)))

(define-rule (+ expr)
  (cond
    ((eq? (cadr expr) 0) (caddr expr)) ; 0 + X = X
    ((eq? (caddr expr) 0) (cadr expr)) ; X + 0 = X
    (else expr)))

(define-rule (exp expr)
  (cond
    ((eq? (caddr expr) 1) (cadr expr)) ; X^1 = X
    (else expr)))

;; END RULE DEFINITIONS

;; (simplify '(+ (/ (/ (* 1 10) 1) 1) (/ 6 1)))
;;  ==> (+ 10 6)

(define (simplify expr)
  (apply-rule
    (map (lambda (sub)
           (let ((nsub (apply-rule sub)))
             (if (list? nsub)
               (simplify nsub)
               nsub)))
         expr)))


;; 3x^3 + 12x
;;   ==>
;; 9x^2 + 12
;;
;; (+ (exp (* 3 x) 3) (* 12 x))
;;   ==>
;; (+ (exp (* 9 x) 2) 12)

(define (differ-exp expr) '())

(define (differentiate expr) '())

;; 3x + 12
;;   ==>
;; 3x^2
;; ---- + 12x + c
;;   2
;;
;; (+ (* 3 x) 12)
;;   ==>
;; (+ (+ (/ (exp (* 3 x) 2) 2) (* 12 x)) c)

(define (integrate expr) '())

