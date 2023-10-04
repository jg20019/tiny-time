(in-package #:tiny-time/db)

(mito:connect-toplevel :sqlite3 :database-name "tiny-time.sqlite3")

(mito:deftable project ()
  ((description :col-type :text)))

(mito:ensure-table-exists 'project)
(mito:migrate-table 'project)

(defun create-project! (&key description)
  "Create new project in database returning project"
  (mito:create-dao 'project :description description))
