(in-package #:tiny-time/views)



;; Views go here
(defmacro with-page ((&key title) &body body)
  `(spinneret:with-html-string
     (:doctype)
     (:html
      (:head
       (:title ,title))
      (:body ,@body))))

(defun new-project ()
  (with-page (:title "Create New Project")
    (:header
      (:h1 "Create Project"))
    (:form :action "/project/new" :method "post"
      (:label "Description")
      (:input :type "text" :name "description")
      (:input :type "submit" :value "Create"))))
