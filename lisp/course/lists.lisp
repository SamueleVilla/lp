;;; -*- Mode: Lisp -*-
;;; lists.lisp

;;; estre l'n-esimo elemento da una lista
;;; CL: nth - list-ref
;;; CL: rest - cdr
;;; CL: first - car
(defun list-ref (n list)
  (if (<= n 0)
      (car list)
      (list-ref (- n 1) (cdr list))))

;;; lunghezza di una lista
;;; con ricorsione in coda
(defun len-cycle (list acc)
  (if (null list)
      acc
      (len-cycle (rest list) (+ 1 acc))))

(defun len (list)
  (len-cycle list 0))

(defun appendi (l1 l2)
  (if (null l1)
      l2
      (cons (car l1) (appendi (cdr l1) l2))))

;;; somma elementi lista
;;; con ricorsione in coda
(defun sum-cycle (list acc)
  (if (null list)
      acc
      (sum-cycle (rest list) (+ acc (first list)))))

(defun sum (list)
  (sum-cycle list 0))

(defun last-list (l)
  (cond ((null l) nil)
	((atom l)
	 (error "L'argomento non e' una lista"))
	((null (rest l)) (first l))
	(t (last-list (rest l)))))

(defun count-atoms (exp)
  (cond ((null exp) 0)
	((atom) 1)
	(t (+ (count-atoms (first exp))
	      (count-atoms (rest exp))))))

(defun depth (exp)
  (cond ((null exp) 1)
	((atom exp) 0)
	(t (max (+ 1 (depth (first exp)))
		(depth (rest exp))))))

(defun flatten (exp)
  (cond ((null exp) exp)
	((atom exp) (list exp))
	(t (appendi (flatten (first exp)) (flatten (rest exp))))))

(defun mirror (exp)
  (cond ((null exp) exp)
	((atom exp) exp)
	(t (append
	    (mirror (rest exp))
	    (list (mirror (first exp)))))))

(defun cons-end (el l)
  (cond ((null l) (cons el NIL))
	(t (cons (car l) (cons-end el (cdr l))))))

(defun invert (l)
  (cond ((null l) l)
	((atom l) l)
	(t (cons-end (first l)
		     (invert (rest l))))))

(defun but-last (l)
  (cond ((null l) l)
	((atom l) l)
	((null (rest l)) NIL)
	(t (cons (first l) (but-last (rest l))))))

(defun circulate (l dir)
  (cond ((atom l) l)
	((null l) l)
	((eq dir 'left)
	 (append (rest l) (list (first l))))
	((eq dir 'right)
	 (cons (last-list l) (but-last l)))
	(t l)))

;;; lists.lisp ends here
