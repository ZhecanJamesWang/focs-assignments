#lang racket

;;; Student Name: Frankly Olin [change to your name]
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;; 1. Turn your evaluator into an interpreter

(define (repl lList)
  (display "mini-eval>>")
  (display (calculate (read)))
  (newline)
  (repl lList))


(define (assq key assList)
	(cond
		[(null? assList) #f]
		[(eq? key (first (first assList))) (second(first assList))]
		[else (assq key (rest assList))]
		)
	)

(define lookup-list
    (list (list 'x 3) 
          (list 'y 12) 
          (list 'z 2))
    )

(define (calculate x)
    (cond
        [(number? x) x]
        [(symbol? x) (assq x lookup-list)]
        [(eq? (first x) 'DEFINE) (repl (cons (list (first (rest x)) (calculate (second (rest x)))) lookup-list ))]
        [(eq? (first x) 'ADD) (+ (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'SUB) (- (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'MUL) (* (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'DIV) (/ (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'GT) (> (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'LT) (< (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'GE) (>= (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'LE) (<= (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'EQ) (equal? (calculate (first (rest x)))(calculate (second (rest x))))]
        [(eq? (first x) 'NEQ) (not (equal? (calculate (first (rest x)))(calculate (second (rest x)))))]
        [(eq? (first x) 'ANND) (and (rest x))]
        [(eq? (first x) 'IPH) (if (equal? #t (calculate (first (rest x)))) (calculate (second (rest x))) (calculate (third (rest x))))]
        )
  )



;;; 2. Implement DEFINE

; (define (DEFINE key body)
; 	(cons (list key (calculate body)) lookup-list )
; 	)

; (DEFINE)
(repl lookup-list)

; (display (cons (list 'c 5) lookup-list ))



