#lang racket

;;; Student Name: Frankly Olin [change to your name]
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;; 1. Turn your evaluator into an interpreter

;;; 2. Implement DEFINE

; (define (DEFINE key body)
;   (cons (list key (calculate body)) lookup-list )
;   )

; (DEFINE)

(define (repl lList)
  (display "mini-eval>>")
  (display (calculate (read) lList))
  (newline)
  (repl lList))


(define (assq key assList)
    (cond
        [(null? assList) #f]
        [(eq? key (first (first assList))) (second(first assList))]
        [else (assq key (rest assList))]
        )
    )

(define zip (lambda (l1 l2) (map list l1 l2)))

(define (calculate x lookup-list)
    (cond
        [(number? x) x]
        [(symbol? x) (assq x lookup-list)]
        [(eq? (first x) 'LAMBDA)(append x lookup-list)]
        [(eq? (first x) 'DEFINE) (repl (cons (list (first (rest x)) (calculate (second (rest x)) lookup-list)) lookup-list))]
        [(eq? (first x) 'ADD) (+ (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'SUB) (- (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'MUL) (* (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'DIV) (/ (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'GT) (> (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'LT) (< (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'GE) (>= (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'LE) (<= (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'EQ) (equal? (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list))]
        [(eq? (first x) 'NEQ) (not (equal? (calculate (first (rest x)) lookup-list)(calculate (second (rest x)) lookup-list)))]
        [(eq? (first x) 'ANND) (and (rest x))]
        [(eq? (first x) 'IPH) (if (equal? #t (calculate (first (rest x)) lookup-list)) (calculate (second (rest x)) lookup-list) (calculate (third (rest x)) lookup-list))]
        [(eq? (first (first x)) 'LAMBDA) (calculate (second (rest (first x))) (append (zip (second (first x)) (map (lambda (y) (calculate y lookup-list)) (rest x))) lookup-list))] 
        )
  )


(repl '())




