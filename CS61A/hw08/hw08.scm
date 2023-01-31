(define (my-filter pred s) 
   (cond
     ((null? s) nil)
     ((pred (car s)) (append (list (car s)) (my-filter pred (cdr s))))
     (else (my-filter pred (cdr s)))
     )
    )

(define (interleave lst1 lst2)
  (cond
    ((null? lst1) lst2)
    ((null? lst2) lst1)
    (else (append (list (car lst1)) (interleave lst2 (cdr lst1))))
    )
  )

(define (accumulate joiner start n term)
  (begin 
    (define (helper joiner k term)
      (if (= k 1) (term k)
        (joiner (term k) (helper joiner (- k 1) term))
        )
      )
    (joiner start (helper joiner n term))
    )
  )

; Reference: https://github.com/MartinLwx/CS61A-Fall-2021-UCB/blob/2cf4b9ec18c7aa274827f2f542b83cb12287a643/Hws/hw08.scm
(define (no-repeats lst)
    (if (null? lst) nil
      (append (list (car lst)) (no-repeats (my-filter (lambda (x) (not (= x (car lst)))) (cdr lst))))
      )
  )
