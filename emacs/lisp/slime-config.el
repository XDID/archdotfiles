(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(setq slime-lisp-implementations '((sbcl ("/usr/bin/sbcl"))))
(slime-setup '(slime-fancy slime-asdf slime-indentation slime-repl))

(provide 'slime-config)
