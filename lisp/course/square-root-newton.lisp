;;; -*- Mode: Lisp -*-
;;; Calcolo delle radici quadrate con il metodo di newton
;;; square-root-newton.lisp

(defun square (x)
  (* x x))

(defun abs (x)
  (if (< x 0) 
      (- x)
      x))

(defun avg (x y)
  (/ (+ x y)
     2.0))

(defun approximate (c x)
  (avg c
       (/ x c)))

(defun is-aproximated (x c) 
  (< (abs
      (-x (square c))))
  0.001)

(defun square-root-cycle (x)
  (if (is-aproximated x c) 
      c 
      (square-root-cycle x (approximate c x))))

(defun square-root (x)
  (square-root-cycle x 1.0))

;;; square-root-newton.lisp ends here
