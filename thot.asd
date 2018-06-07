;;
;;  Thot - http web server
;;  Copyright 2017,2018 Thomas de Grivel <thoxdg@gmail.com> 0614550127
;;

(in-package :common-lisp-user)

(defpackage :thot.system
  (:use :common-lisp :asdf))

(in-package :thot.system)

(defsystem "thot"
  :depends-on ("babel"
               "bordeaux-queue"
               "bordeaux-set"
               "bordeaux-threads"
               "babel-stream"
               "cffi-dirent"
               #+linux "cffi-epoll"
               "cffi-socket"
               "cffi-stat"
               "cl-debug"
               "cl-stream"
               "html-entities"
               "rol-uri"
               "str"
               "unistd-stream")
  :components
  ((:file "package")
   (:file "mime" :depends-on ("package"))
   (:file "thot" :depends-on ("mime"))
   (:file "thot-simple" :depends-on ("thot"))
   (:file "thot-threaded" :depends-on ("thot-simple"))
   #+linux (:file "thot-epoll" :depends-on ("thot-threaded"))))
