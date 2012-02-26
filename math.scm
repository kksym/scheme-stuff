
(define pi 
  (* 4 (atan 1)))

(define (circle-area r)
  "Calculate the area of a circle with the radius R."
  (* pi (expt r 2)))

(define (pythagoras a b)
  "Calculate the length of the hypotenuse of a right-angled triangle."
  (sqrt (+ (expt a 2) (expt b 2))))

(define (derivative f x dx)
  "Approximate the derivative of F at (x + dx)."
  (/ (- (f (+ x dx)) (f x)) dx))

(define (naive-factorial n)
  "A naive algorithm for computing n!"
  (if (not (zero? n))
    (* n (naive-factorial (- n 1)))
    1))

(define (gamma n . f)
  "Gamma function, allows caller to supply their own factorial implementation
   but defaults to NAIVE-FACTORIAL if none is supplied."
  (if (not (null? f))
    ((car f) (- n 1))
    (naive-factorial (- n 1))))

(define (integer->list-by-base nn base)
  "Converts an integer into a list of its parts, in the specified base."
  (let loop ((accum '())
             (n nn))
    (let ((rem (remainder n base))
          (quo (quotient n base)))
      (cond
       ((zero? n) (cons 0 accum))
       ((and (zero? rem) (< n base)) accum)
       (else (loop (cons rem accum) quo))))))

(define (integer->list n)
  "Converts an integer into a list of its digits, in base 10."
  (integer->list-by-base n 10))

(define (integer->binary-list n)
  "Converts an integer into a base 2 (binary) list."
  (integer->list-by-base n 2))

