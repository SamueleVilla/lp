;;; -*- Mode: Lisp -*-

(defun double (n) (* 2 n))

;; Lamda expressions
(lambda (x) (+ 2 x))

;; Special Operators: Conditionals
;; Cond opertator
(defun absolute-value (x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(defun absolute-value-v2 (x)
  (cond ((> x 0) x)
        (T (- x))))
;; If operator
(defun absolute-value-v3 (x)
  (if (> x 0)
      x     ;; then
    (- x))) ;; else

;; Example: Square Roots with Newton's Method

(defun good-enaugh? (x c)
  (< (absolute-value (- x (square c)))  
     0.001))
(defun avg (x y) 
  (/ (+ x y)
     2.0))
(defun improve (c x) 
  (avg c 
       (/ x c)))
(defun square-root-cycle (x c)
  (if (good-enough? x c)
      c
    (square-root-cycle x (improve c x))))
