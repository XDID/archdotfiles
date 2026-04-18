;; input method
(defvar my-im-status "keyboard-us")

(defun my-fcitx-save-and-switch-to-english ()
  (setq my-im-status (string-trim (shell-command-to-string "fcitx5-remote -n")))
  (call-process "fcitx5-remote" nil nil nil "-s" "keyboard-us"))

(defun my-fcitx-restore-chinese-im ()
  (when (and my-im-status (not (string= my-im-status "keyboard-us")))
    (call-process "fcitx5-remote" nil nil nil "-s" my-im-status)))

(with-eval-after-load 'evil
  (add-hook 'evil-insert-state-exit-hook #'my-fcitx-save-and-switch-to-english)
  (add-hook 'evil-insert-state-entry-hook #'my-fcitx-restore-chinese-im))

;; backupfile dir
(defvar my-emacs-tmp-dir (expand-file-name "tmp/" user-emacs-directory))
(unless (file-exists-p my-emacs-tmp-dir)
  (make-directory my-emacs-tmp-dir t))

(setq backup-directory-alist `(("." . ,(expand-file-name "backups/" my-emacs-tmp-dir))))

(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-save/" my-emacs-tmp-dir) t)))
(setq create-lockfiles nil)

;; editing defaults
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq-default sh-basic-offset 4)
(setq-default sh-indentation 4)
(setq-default python-indent-offset 4)
(setq-default python-shell-indent-offset 4)

(electric-pair-mode 1)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(defun my/set-common-prog-indent ()
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (when (boundp 'standard-indent)
    (setq-local standard-indent 4))
  (when (boundp 'tab-stop-list)
    (setq-local tab-stop-list (number-sequence 4 200 4)))
  (when (boundp 'c-basic-offset)
    (setq-local c-basic-offset 4))
  (when (boundp 'js-indent-level)
    (setq-local js-indent-level 4))
  (when (boundp 'js-jsx-indent-level)
    (setq-local js-jsx-indent-level 4))
  (when (boundp 'typescript-ts-mode-indent-offset)
    (setq-local typescript-ts-mode-indent-offset 4))
  (when (boundp 'css-indent-offset)
    (setq-local css-indent-offset 4))
  (when (boundp 'nxml-child-indent)
    (setq-local nxml-child-indent 4))
  (when (boundp 'nxml-attribute-indent)
    (setq-local nxml-attribute-indent 4))
  (when (boundp 'sh-basic-offset)
    (setq-local sh-basic-offset 4))
  (when (boundp 'sh-indentation)
    (setq-local sh-indentation 4))
  (when (boundp 'python-indent-offset)
    (setq-local python-indent-offset 4))
  (when (boundp 'python-shell-indent-offset)
    (setq-local python-shell-indent-offset 4))
  (when (boundp 'lua-indent-level)
    (setq-local lua-indent-level 4))
  (when (boundp 'rust-indent-offset)
    (setq-local rust-indent-offset 4))
  (when (boundp 'go-ts-mode-indent-offset)
    (setq-local go-ts-mode-indent-offset 4)))

(add-hook 'prog-mode-hook #'my/set-common-prog-indent)

;; some config
(setq use-short-answers t)
