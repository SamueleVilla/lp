;;; -*- Mode: Lisp -*-
;;; treemap.lisp

;;; --  Node functions -- 
(defstruct node
  (key nil)
  (value nil)
  (left nil)
  (right nil))

(defun node-new (key value &optional left right) 
  "Create the node with the given parameters."
  (make-node :key key :value value :left left :right right))

(defun node-insert (node key value)
  "Insert a node with the given key and value into the binary search tree rooted at NODE."
  (cond ((null node)
	 (node-new key value))
	((< key (node-key node))
	 (node-new (node-key node)
		   (node-value node)
		   (node-insert (node-left node) key value)
		   (node-right node)))
	 (t (node-new (node-key node)
			 (node-value node)
			 (node-left node)
			 (node-insert (node-right node) key value)))))

(defun node-search (node key)
  "Find the node with the key in the given tree."
  (cond ((null node)
         NIL)
        ((= key (node-key node))
         node)
        ((< key (node-key node))
         (node-search (node-left node) key))
        (t (node-search (node-right node) key))))

(defun node-minimum (node)
  "Find the node with the minimum key in the given tree."
  (if (node-left node)
      (node-minimum (node-left node))
      node))

(defun node-maximum (node)
  "Find and return the node with the maximum key in the binary search tree rooted at NODE."
  (if (node-right node)
      (node-maximum (node-right node))
      node))

(defun remove-min (node)
  "Remove the node with the minimum key in the given tree."
  (if (null (node-left node))
      (node-right node)
      (node-new (node-key node)
		(node-value node)
		(remove-min (node-left node))
		(node-right node))))

(defun node-traversal-in (node)
  "Perform in-order traversal of the tree and return a list of keys."
  (if (null node)
      nil
      (append (node-traversal-in (node-left node))
	      (list (node-key node))
	      (node-traversal-in (node-right node)))))

(defun node-print (node &optional (out *standard-output*) (level 0))
  "Print the contents of the NODE and its children with optional indentation level."
  (if node
      (progn
	(format out "(~A, ~A)"(node-value node) (node-key node))
	(node-print (node-left node) out (+ level 2))
	(node-print (node-right node) out (+ level 2)))))

(defun print-spaces (depth stream)
  "Print spaces for indentation"
  (when (> depth 0)
    (format stream " ")
    (print-spaces (1- depth) stream)))

(defun node-print (node &optional (out *standard-output*) (side "r") (level 0))
  "Print a struct-based tree node recursively with indentation.
   
   Arguments:
   - node: The tree node to print (node struct)
   - out: Output stream (defaults to standard output)
   - depth: Current depth in the tree for indentation (internal use)"
  
  (when (null node)
    (return-from node-print))

  (dotimes (i level)
    (format out " "))
  
  (format out "~A => ~A~%" side (node-key node))

  (when (node-left node)
    (node-print (node-left node) out "l" (+ 4 level)))

  (when (node-right node)
    (node-print (node-right node) out "r" (+ 4 level))))

;;; -- Treemap functions --
(defstruct treemap
  (name nil)
  (root nil))

(defun treemap-new (name)
  (make-treemap :name name))

(defun treemap-insert (treemap key value)
  (setf (treemap-root treemap) (node-insert (treemap-root treemap) key value)))

(defun treemap-search (treemap key)
  (node-search (treemap-root treemap) key))

(defun treemap-minimum (treemap)
  (node-value (node-minimum (treemap-root treemap))))

(defun treemap-maximum (treemap)
  (node-value (node-maximum (treemap-root treemap))))

(defun treemap-traversal-in (treemap)
  (node-traversal-in treemap))

(defun treemap-print (treemap &optional (out *standard-output*))
  (progn
    (format out "Treemap: ~A~%" (treemap-name treemap))
    (node-print (treemap-root treemap) out)))

;;; -- Test --
 
(defparameter *movies* (treemap-new "Movies"))

(treemap-insert *movies* 1980 "The Blues Brothers")
(treemap-insert *movies* 1998 "The Matrix")
(treemap-insert *movies* 2021 "Dune")
(treemap-insert *movies* 2023 "Barbie")
(treemap-insert *movies* 1982 "Star Trek: The Wrath of Khan")
(treemap-insert *movies* 2024 "Megalopolis")
(treemap-insert *movies* 1940 "Fanatasia")
(treemap-insert *movies* 2016 "La La Land")

;; treemap.lisp ends here.
