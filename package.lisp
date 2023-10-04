;;;; package.lisp

(defpackage #:tiny-time
  (:use #:cl))

(defpackage #:tiny-time/db
  (:use #:cl)
  (:export :create-project!
           :project-description
           :project-id))

(defpackage #:tiny-time/views
  (:use #:cl)
  (:export :new-project))

(defpackage #:tiny-time/controllers
  (:use #:cl)
  (:export :new-project))
