;;;; time-tracker.asd

(asdf:defsystem #:tiny-time
  :description "POC time tracker in common lisp"
  :author "John Gibson <jg20019@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (:hunchentoot :spinneret :mito)
  :components ((:file "package")
               (:file "tiny-time")))
