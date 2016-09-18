#lang racket

(define operator-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)))

(first (assq 'ADD operator-list))
(second (assq 'ADD operator-list))
