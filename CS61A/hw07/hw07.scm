(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (ascending? asc-lst) 
  (cond ((null? asc-lst) #t)
        ((null? (cdr asc-lst)) #t)
        ((<= (car asc-lst) (cadr asc-lst)) (ascending? (cdr asc-lst)))
        (else #f)
   )
  )

(define (square n) (* n n))

(define (pow base exp)
  (cond ((= exp 0) 1)
        ((= base 1) 1)
        ((even? exp) (square (pow base (quotient exp 2))))
        ((odd? exp) (* base (pow base (- exp 1))))
        )
  )
