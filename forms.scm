
(define-syntax when
  (syntax-rules ()
    ((_ PRED BODY ...)
     (if PRED (begin BODY ...)))))

