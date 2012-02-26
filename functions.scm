
(define ($ f . xs)
  "Explicit application function."
  (apply f xs))

(define (compose g f)
  "Compose the functions G and F."
  (lambda args
    (g (apply f args))))

(define compose-all
  (lambda fxs
    "Compose a variable amount of functions."
    (lambda args
      (let loop ((fun (lambda (x) x))
                 (nfxs (reverse fxs)))
        (if (null? nfxs)
          (apply fun args)
          (loop (lambda args
                  (apply (compose (car nfxs) fun) args))
                (cdr nfxs)))))))

