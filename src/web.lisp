(in-package :cl-user)
(defpackage lisp-for-the-web.web
  (:use :cl
        :caveman2
        :lisp-for-the-web.config
        :lisp-for-the-web.view
        :lisp-for-the-web.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :lisp-for-the-web.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

(defroute "/about" ()
  (render #P"about.html"))
;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
