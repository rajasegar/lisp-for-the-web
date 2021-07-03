(defsystem "lisp-for-the-web-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Rajasegar Chandran"
  :license ""
  :depends-on ("lisp-for-the-web"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "lisp-for-the-web"))))
  :description "Test system for lisp-for-the-web"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
