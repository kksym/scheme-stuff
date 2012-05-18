
(use vector-lib)

;; matrix.scm
;; For dealing with matrices

(define mat1 '#(#(1 2 3)
                #(7 2 9)
                #(8 8 0)))

(define mat2 '#(#(2 2 3)
                #(1 4 2)
                #(1 1 2)))

(define (matrix-value m x y)
  "Returns the matrix's value at x,y (Indexing from 0)."
  (vector-ref (vector-ref m y) x))

(define (matrix? m)
  "Checks to see if M is a matrix."
  (let ((len (vector-length (vector-ref m 0)))
        (ylen (- (vector-length m) 1)))
    (let loop ((idx 1))
      (if (eq? (vector-length (vector-ref m idx)) len)
        (if (eq? idx ylen)
          #t
          (loop (+ idx 1)))
        #f))))

(define (matrix-scalar-multiply m val)
  (if (matrix? m)
    (vector-map (lambda (_ col)
                  (vector-map (lambda (_ elem)
                                (* elem val)) col)) m)))

(define (matrix-add m1 m2)
  (if (and (matrix? m1) (matrix? m2))
    (vector-map (lambda (_ r1 r2)
                  (vector-map (lambda (_ e1 e2)
                                (+ e1 e2)) r1 r2)) m1 m2)))

(define (matrix-multiply m1 m2) '())

