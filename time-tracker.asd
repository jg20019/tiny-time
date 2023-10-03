;;;; time-tracker.asd

(asdf:defsystem #:time-tracker
  :description "Describe time-tracker here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (:hunchentoot :spinneret :mito)
  :components ((:file "package")
               (:file "time-tracker")))
