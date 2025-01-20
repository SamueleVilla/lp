;;; -*- Mode: Lisp -*-
;;; recursion.lisp

;;; factorial
(defun factorial (n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

;;; factorial with accumulator
(defun fact-cycle (n acc)
  (if (= n 0)
      acc
      (fatt (- n 1) (* n acc))))

(defun fact-v2 (n)
  (fact-cycle (n 1)))

;;; fibonacci
(defun fib (n)
  (cond ((= n 0) 1)
	((= n 1) 1)
	(T (+ (fib (- n 2)) (fib (- n 1))))))

;;; recursion.lisp ends here
