
(define-syntax when
  (syntax-rules ()
    ((_ PRED BODY ...)
     (if PRED (begin BODY ...)))))

(define-syntax define-object
  (syntax-rules (let-members let-methods)
    ((_ NAME
       (let-members MEMBERS)
       (let-methods METHODS))
     (define 

(define-object stack
  (let-members ((stk '())))
  (let-methods
    ((push! obj) (set! stk (cons obj stk)))
    ((pop!) (let ((top (car stk)))
              (set! stk (cdr stk))
              top))))

