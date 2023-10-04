(in-package :tiny-time/controllers)

(hunchentoot:define-easy-handler (new-project :uri "/project/new") ()
  (tiny-time/views:new-project))
