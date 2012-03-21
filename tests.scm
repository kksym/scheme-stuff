
;; chicken-install test
(use test)

;; SIMPLIFIER TESTS
(load "sym.scm")

;; BASIC SIMPLIFICATION RULES
    (test 10 (simplify '(/ 10 1)))
    (test 10 (simplify '(* 1 10)))

;; MULTIPLE SIMPLIFICATION RULES
    (test '(+ 10 6) (simplify '(+ (/ 10 1) 6)))
    (test '(+ 10 6) (simplify '(+ (/ 10 (* 1 1)) (* 1 6))))
    (test 6 (simplify '(/ (* 1 (/ 6 1)) (/ 1 1))))

