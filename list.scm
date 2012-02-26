
(define (foldl f z xs)
  "Left fold."
  (if (not (null? xs))
    (foldl f (f z (car xs)) (cdr xs))
    z))

(define (foldr f z xs)
  "Right fold."
  (if (not (null? xs))
    (f (car xs) (foldr f z (cdr xs)))
    z))

