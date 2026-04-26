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

(provide 'basic)
