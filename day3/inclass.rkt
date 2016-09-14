#lang racket
; 0000000
(define (factorial num)
	(if (equal? 0 num) 
		1
		(* (factorial (- num 1)) num)
		)
	)

; (factorial 5)



(define (tail_factorial num left)
	(if (= 0 num) 
		left
		(tail_factorial (- num 1) (* left num))
		)
	)

(define (tFactorialHelp num)
	(tail_factorial num 1)
	)


; (tFactorialHelp 5)

; 11111111

(define (filter conds obj)
	(cond
		[(null? obj) '()]
   		[(conds (first obj)) (cons (first obj) (filter  even? (rest obj)))]
   		[else (filter  even? (rest obj))]
   		)
	)

(define (filterHelp num)
	(filter even? num)
	)

; (filterHelp '(1 2 3 4))

; 2222222


(define(double x)
	(* 2 x)
	)

(define (map conds obj)
	(if(null? obj) 
		'()
   		(cons (conds (first obj)) (map conds (rest obj))))
	)


; (map double '(1 2 3 4))

; (double 2)


; 3333333

(define (append list)
	(if(null? list) 
		'()
   		(cons (first list) (rest list)))
	)

(define (appendHelp list1 list2)
	(cons (append list1) (append list2))
	)



(appendHelp '(1 2 3 4) '(5 6 7))

