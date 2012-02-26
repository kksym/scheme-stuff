
(define ($ f . xs)
  "Explicit application function."
  (apply f xs))

(define (id x)
  "Identity function."
  x)

(define (compose g f)
  "Compose the functions G and F."
  (lambda args
    (g (apply f args))))

(define compose-all
  (lambda fxs
    "Compose a variable amount of functions."
    (lambda args
      (let loop ((fun id)
                 (nfxs (reverse fxs)))
        (if (null? nfxs)
          (apply fun args)
          (loop (lambda args
                  (apply (compose (car nfxs) fun) args))
                (cdr nfxs)))))))

