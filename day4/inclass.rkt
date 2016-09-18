#lang racket

; ;; 1. list-length
; (define (list-length x)
; 	(if (null? x)
; 		0
; 		(+ 1 (list-length (rest x))
; 		))
; 	)


; (list-length '(1 2 3))


; ;; 2. count-evens

; (define (count-evens x)
; 	(list-length (filter even? x))
; 	)

; (count-evens '(1 2 3 4 5 6))


; ;; 3. list-square


; (define (list-square x)
; 	(map (lambda (number)
; 	         (* number number))
; 	       x)
; 	)

; (list-square '(1 2 3 4 5 6))


; ;; 4. list-add1

; (define (list-add1 x)
; 	(map (lambda (number)
; 	         (+ number 1))
; 	       x)
; 	)

; (list-add1 '(1 2 3 4 5 6))


; ;; 5. list-add10

; (define (list-add10 x)
; 	(map (lambda (number)
; 	         (+ number 10))
; 	       x)
; 	)

; (list-add10 '(1 2 3 4 5 6))


; ;; 6. list-addn

; (define (list-addn n x)
; 	(map (lambda (number)
; 	         (+ number n))
; 	       x)
; 	)

; (list-addn 10 '(1 2 3 4 5 6))


; ;; 7. filter-even


; (define (filter-even x)
; 	(cond
; 		[(null? x) '()]
; 		[(even? (first x)) (cons (first x) (filter-even (rest x)))]
; 		[else (filter-even (rest x))]
; 		)
; 	)

; (filter-even '(1 2 3 4 5 6))

; ;; 8. filter-positive

; (define (filter-positive x)
; 	(cond
; 		[(null? x) '()]
; 		[(positive? (first x)) (cons (first x) (filter-positive (rest x)))]
; 		[else (filter-positive (rest x))]
; 		)
; 	)

; (filter-positive '(1 -2 3 -4 5 6))

; ;; 9. filter-gt

; (define (filter-gt n x)
; 	(cond
; 		[(null? x) '()]
; 		[(>=  (first x) n) (cons (first x) (filter-gt n (rest x)))]
; 		[else (filter-gt n (rest x))]
; 		)
; 	)

; (filter-gt 40 '(10 30 40 50 60))


; (define (helper x)
; 	(+ x n)
; 	)

; (define (list-addn n lst)
; 	(map helper lst)
; 	)

; (list-addn 2 '(1 2 3))