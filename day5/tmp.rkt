#lang racket

; ; (define lookup-list
; ;     (list (list 'x 3) 
; ;           (list 'y 12) 
; ;           (list 'z 2)
; ;     ))




; ; (append (list 'a 4444) lookup-list)

; ; (display lookup-list)


; (list? (first '((LAMBDA (x y) (ADD (MUL x x) (MUL y y))) 2 (SUB 4 1))))

; (list? '(LAMBDA (x y) (ADD (MUL x x) (MUL y y))))


; (first '(LAMBDA (x y) (ADD (MUL x x) (MUL y y))))
; (first (first '((LAMBDA (x y) (ADD (MUL x x) (MUL y y))) 2 (SUB 4 1))))
; ()
; (zip '(1 2) '(3 4))

((lambda (x y) (+ (* x x) (* y y))) 2 3)