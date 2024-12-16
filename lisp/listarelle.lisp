;;; -*- Mode: Lisp -*-
;;; listarelle.lisp

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

;; listarelle.lisp ends here