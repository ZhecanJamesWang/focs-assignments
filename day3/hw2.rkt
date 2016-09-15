#lang racket
;;; Student Name: Frankly Olin [Zhecan Wang]
;;;
;;; Check one:
;;; [1] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.
; 'ADD 'SUB 'MUL 'DIV
(define (add num)
	(if (null? num)
		0
		(+ (first num) (add ( rest num))))
	)

(define (sub num)
	(if (null? num)
		0
		(- (first num) (sub ( rest num))))
	)

(define (mul num)
	(if (null? num)
		1
		(* (first num) (mul ( rest num))))
	)

(define (div num)
	(if (null? num)
		1
		(/ (first num) (div ( rest num))))
	)

(define (calculate x)
	(cond
		[(eq? (first x) 'ADD) (add (rest x))]
   		[(eq? (first x) 'SUB) (sub (rest x))]
   		[(eq? (first x) 'MUL) (mul (rest x))]
   		[else (div (rest x))]
   		)
  )

;(display (add '(1 2)))(newline)
(display (sub '(5 1)))(newline)
(display (mul '(5 3)))(newline)
(display (div '(10 5)))(newline)

(calculate '(ADD 3 4)) ;; --> 7

; ;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.

(define (calculate x)
	(cond
		[(number? x) x]
		[(eq? (first x) 'ADD) (+ (calculate (first (rest x)))(calculate (second (rest x))))]
   	[(eq? (first x) 'SUB) (- (calculate (first (rest x)))(calculate (second (rest x))))]
   	[(eq? (first x) 'MUL) (* (calculate (first (rest x)))(calculate (second (rest x))))]
   	[(eq? (first x) 'DIV) (/ (calculate (first (rest x)))(calculate (second (rest x))))]
   	)
  )

(calculate '(ADD 3 (MUL 4 5))) ;; --> 23   ;; what is the equivalent construction using list?
(calculate '(SUB (ADD 3 4) (MUL 5 6))) ;; --> -23

; ;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
; ;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
; ;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

(define (calculate x)
	(cond
		[(number? x) x]
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
   		)
  )
   		; [else (calculate (first x))]

(calculate '(GT (ADD 3 4) (MUL 5 6))) ;; --> #f
(calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #t

;;; 4. Add boolean operations ANND, ORR, NOTT

(define (calculate x)
	(cond
		[(number? x) x]
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
   		[(eq? (first x) 'ANND) (and (calculate (first (rest x))) (calculate (second  (rest x))))]
   		)
  )
(calculate '(ANND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))))) ;; --> #f
(calculate '(NOTT (ANND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))))) ;; --> #t

; ;;; 5. Add IPH

(define (calculate x)
	(cond
		[(number? x) x]
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
(calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3))) ;; -> 4
