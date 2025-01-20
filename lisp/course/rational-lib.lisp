;;; -*- Mode: Lisp -*-
;;; rational-lib.lisp

;;; Supponiamo di voler costruire una libreria per fare calcoli con numeri
;;; razionali.

;;; Funzione per costruire un numero razionale dove n e' il numere
;;; e d il denome
(defun numer (r) (car r))

(defun denom (r) (cdr r))

(defun create-rat (n d)
  (cons n d))

(defun sum-rat (r1 r2)
  (create-rat (+ (* (numer r1) (denom r2))
		 (* (numer r2) (denom r1)))
	      (* (denom r1) (denominator r2))))

(defun mult-rat (r1 r2)
  (create-rat (* (numer r1) (numerator r2))
	      (* (denom r2) (denominator r2))))

(defun eq-raz (r1 r2)
  (= (* (numer r1) (denom r2))
     (* (numer r2) (denom r1))))

;;; rational-lib.lisp
