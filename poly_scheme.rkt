#lang racket

;William Keely ID: 113428672
;list/utility ops
(define (revlist l)
  (if (null? l)
      l
      (append (revlist (cdr l))(list (car l)))))
(define (zero_trim l)
  (if (null? l)
      l
      (if (= (car l) 0)
          (zero_trim (cdr l))
          l)))
(define (zero_add x)
  (if (< x 1)
      (list )
      (cons 0 (zero_add (- x 1)))))
(define (degree apol)
  (if (null? apol)
      0
       (+ 1 (degree(cdr apol))) ))
(define (change_deg x apol)
  (append (zero_add x) apol))
(define (last apol)
  (if (null? (cdr apol))
      (car apol)
      (last (cdr apol))))
(define (removelast apol)
  (if (null? (cdr apol))
      (list )
      (cons (car apol)(removelast(cdr apol)))))




; binary ops
(define (poly_add apol bpol)
  (revlist apol)
  (revlist bpol)
  (if (null? apol)
      (zero_trim bpol)
      (if (null? bpol)
          (zero_trim apol)
          (revlist(zero_trim(revlist(cons (+ (car apol) (car bpol))(poly_add (cdr apol)(cdr bpol)))))))))

(define (poly_sub apol bpol)
   (if (null? apol)
      (zero_trim bpol)
      (if (null? bpol)
          (zero_trim apol)
          (revlist(zero_trim(revlist(cons (- (car apol) (car bpol))(poly_sub (cdr apol)(cdr bpol)))))))))
(define (poly_mul apol bpol)
  (revlist(zero_trim(revlist(poly_mull apol  bpol)))))
(define (poly_mull apol bpol)
  (if (null? bpol)
      (zero_add 1)
         (mul_add (int_pol_mult (car bpol) apol) (poly_mull(change_deg 1 apol) (cdr bpol))))) 
(define (mul_add apol bpol)
  (if (null? apol)
      bpol
      (if (null? bpol)
          apol
          (cons (+ (car apol) (car bpol))(mul_add (cdr apol) (cdr bpol))))))

(define (poly_compute_der apol)
  (if (null? apol)
      (list )
      (cons (* (last apol) (degree apol) )(poly_compute_der (removelast apol)))))

(define (poly_der apol)
  (revlist(zero_trim(poly_compute_der(cdr apol)))))

(define (poly_mod apol bpol)
  
  (poly_modulo (revlist apol) (revlist bpol)))

(define (poly_modulo apol bpol)
  (if (= (length apol) 1)
      apol
   (poly_modulo (zero_trim(poly_sub apol (int_pol_mult(/(car apol)(car bpol)) bpol))) bpol)))

(define (int_pol_mult x apol)
  (if(null? apol)
      (list )
      (cons (* x (car apol))(int_pol_mult x (cdr apol)))))
  
