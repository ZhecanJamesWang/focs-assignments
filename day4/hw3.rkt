#lang racket

;;; Student Name: Frankly Olin [change to your name]
;;;
;;; Check one:
;;; [1] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.

(define operator-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)
        (list 'EQ =)
        (list 'NEQ (lambda (x y) (not (= x y))))
        (list 'ANND (lambda (x y) (and x y)))
        (list 'ORR (lambda (x y) (or x y)))
        (list 'NOTT not)))


(define (assq key assList)
	(cond
		[(null? assList) #f]
		[(eq? key (first (first assList))) (second(first assList))]
		[else (assq key (rest assList))]
		)
	)
(assq 'ADD operator-list) ;; --> '(ADD #<procedure:+>)
(assq 'ANND operator-list) ;; --> '(ANND #<procedure>)
(assq 'FOO operator-list) ;;--> #f



;;;;;;;;;;;
;; 2. lookup-list


(define lookup-list
    (list (list 'x 3) 
          (list 'y 12) 
          (list 'z 2))
    )

(define (calculate x)
    (cond
        [(number? x) x]
        [(symbol? x) (assq x lookup-list)]
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


(calculate '(ADD x y))
(calculate '(SUB (ADD x y) (MUL y z))) 



;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.
