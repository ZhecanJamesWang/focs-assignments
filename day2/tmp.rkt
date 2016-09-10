#lang racket

; @param lst [List] Takes in a tree-rep of list
; @return [List] Tree with list format
(define (tree-add1 lst)
  (cond
  	[(null? lst) lst]
    [else (+ (first lst) 1) ]

(display (tree-add1 '(3 (1 4))))