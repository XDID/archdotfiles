;; change auto back save file position
(defconst my/backup-directory
  (expand-file-name "backup/" user-emacs-directory))

(make-directory my/backup-directory t)
(setq backup-directory-alist `(("." . ,my/backup-directory))
      auto-save-file-name-transforms `((".*" ,my/backup-directory t))
      auto-save-list-file-prefix
      (expand-file-name ".saves-" my/backup-directory))

;; set custom file
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file)

;; some configs
(electric-pair-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq-default c-basic-offset 4)
(setq
 fringes-outside-margins t
 echo-keystrokes 0.1
 tab-always-indent 'complete
 track-eol t
 next-line-add-newlines nil
 uniquify-buffer-name-style 'post-forward-angle-brackets)
(fset 'yes-or-no-p 'y-or-n-p)
(save-place-mode 1)

(defun my/force-4-space-indent ()
  (unless (derived-mode-p 'makefile-mode 'makefile-gmake-mode 'makefile-bsdmake-mode)
    (setq-local indent-tabs-mode nil)
    (setq-local tab-width 4)
    (setq-local standard-indent 4)
    ;; CC (C/C++/Java/etc)
    (when (derived-mode-p 'c-ts-mode 'c++-ts-mode )
      (setq-local c-basic-offset 4))
    ;; Python
    (when (derived-mode-p 'python-ts-mode)
      (setq-local python-indent-offset 4))
    ;; Web / HTML / CSS / SGML
    (when (derived-mode-p 'html-mode 'css-mode 'web-mode 'sgml-mode)
      (setq-local sgml-basic-offset 4))
    ;; Lisp
    (when (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'scheme-mode)
      (setq-local lisp-body-indent 4))
    ;; Rust (rust-mode / rust-ts-mode)
    (when (derived-mode-p 'rust-ts-mode)
      (setq-local rust-indent-offset 4))
    ;; Lua (lua-mode)
    (when (derived-mode-p 'lua-ts-mode)
      (setq-local lua-indent-level 4))
    ;; If using tree-sitter based modes with different variables, add them here
    ))

(my/force-4-space-indent)

(provide 'basic)
