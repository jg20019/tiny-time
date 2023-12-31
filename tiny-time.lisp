;;;; time-tracker.lisp
(in-package #:tiny-time)

;;;; DATABASE MODEL

(mito:connect-toplevel :sqlite3 :database-name "tiny-time.sqlite3")

(mito:deftable user ()
  ((name :col-type (:varchar 64))
   (email :col-type (:varchar 128))
   (password :col-type (:text)))
  (:unique-keys :email))

(mito:ensure-table-exists 'user)
(mito:migrate-table 'user)

(defun create-user! (&key name email password)
  "Create a user in the database."
  (mito:create-dao 'user :name name :email email :password password))

(mito:deftable project-status ()
  ((name :col-type (:varchar 50)))
  (:unique-keys :name))

#+nil
(progn
  (mito:ensure-table-exists 'project-status)
  (mito:migrate-table 'project-status))

;; TODO
;; Make this catch sqlite uniqueness constraints
;; defined on project status while forwarding other errors
;; No idea why it won't work currently
(defun ensure-statuses-exist! (&rest project-status-names)
  "Make sure statuses with given names exist in database."
  (dolist (name project-status-names)
    (handler-case
        (mito:create-dao 'project-status :name name)
      (sqlite:sqlite-error (c)
        (unless (equal 'constraint (sqlite:sqlite-error-code c))
          (format t "Error code: ~a~%" (sqlite:sqlite-error-code c)))))))


#+nil
(ensure-statuses-exist! "created" "in progress" "pending-review" "pending-payment" "payment-complete")


(defun find-status-id (status-name)
  (project-status-id (mito:find-dao 'project-status :name status-name)))


;;;; SERVER
(defvar *acceptor* nil)

(defun start (&key (port 4242))
  "Start acceptor on given port"
  (setf *acceptor* (make-instance 'hunchentoot:easy-acceptor :port port))
  (hunchentoot:start *acceptor*))

(start)
