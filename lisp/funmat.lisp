;;; -*- Mode: Lisp -*-
;;; funmath.lisp

;; absolute-value x
;; valore assoluto del numero x
(defun absolute-value (x)
(cond ((> x 0) x)
       ((= x 0) 0)
       ((< x 0) (- x))))

;; fact n
;; fattoriale
(defun fact (n)
  (if (zerop n)
      1
    (* n (fact (- n 1)))
    ))

;; list-len ls
;; lunghezza della lista ls
(defun list-len (ls)
  (if (null ls)
      0
    (1+ (list-len (rest ls)))
   ))

;; list-ref
;; elemento nella n-esima poszione della lista ls
(defun list-ref (ls n)
  (if (= n 1)
      (first ls)
    (list-ref (rest ls) (- n 1))))

;; sqrt
;; radice quadrata con metodo di Newton

(defun good-enough? (x c)
  (< (absolute-value (- x (square c)))
     0.001))

(defun avg (x y) (/ (+ x y) 2.0))

(defun improve (c x) (avg c (/ x c)))

(defun sqaure-root-cycle (x c)
  (if (good-enough? x c)
    c
    (square-root-cycle x (improve c x))))


;;; funamth.lisp ends here.
