(define (over-or-under num1 num2)
  (cond ((< num1 num2) -1)
        ((= num1 num2) 0)
        (else 1)
    )
  )

(define (make-adder num)
  (lambda (inc) (+ num inc))
  )

(define (composed f g)
  (lambda (x) (f (g x)))
  )

(define lst
  (cons (list 1) (cons 2 (list (list 3 4) 5)))
  )

(define (duplicate lst)
  (if (null? lst) nil
    (append (list (car lst) (car lst)) (duplicate (cdr lst)))
    )
)
