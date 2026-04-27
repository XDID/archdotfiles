;;; keymap-evil.el --- Evil key bindings -*- lexical-binding: t; -*-

(defun my/evil-force-quit ()
  (interactive)
  (evil-quit t))

(defun my-eldoc-toggle ()
    (interactive)
    (let ((visible-wins (window-list (selected-frame)))
          (eldoc-win nil))
      (dolist (win visible-wins)
        (let ((buf-name (buffer-name (window-buffer win))))
          (when (string-match-p "\\*.*eldoc" buf-name)
            (setq eldoc-win win))))
      (if eldoc-win
          (delete-window eldoc-win)
        (call-interactively 'eldoc-print-current-symbol-info))))

(with-eval-after-load 'evil
  (evil-set-leader '(normal visual motion) (kbd "SPC"))

  (evil-global-set-key 'normal (kbd ":") #'execute-extended-command)
  (evil-global-set-key 'visual (kbd ":") #'execute-extended-command)
  (evil-global-set-key 'motion (kbd ":") #'execute-extended-command)

  (evil-global-set-key 'normal (kbd "<leader> q") #'evil-quit)
  (evil-global-set-key 'visual (kbd "<leader> q") #'evil-quit)
  (evil-global-set-key 'motion (kbd "<leader> q") #'evil-quit)

  (evil-global-set-key 'normal (kbd "<leader> Q") #'my/evil-force-quit)
  (evil-global-set-key 'visual (kbd "<leader> Q") #'my/evil-force-quit)
  (evil-global-set-key 'motion (kbd "<leader> Q") #'my/evil-force-quit)

  (evil-global-set-key 'normal (kbd "C-s") #'save-buffer)
  (evil-global-set-key 'insert (kbd "C-s")
                     (lambda () (interactive) (save-buffer) (evil-normal-state)))
  (evil-global-set-key 'visual (kbd "C-s")
                     (lambda () (interactive) (save-buffer) (evil-normal-state)))

  (evil-global-set-key 'normal (kbd "<leader> b d") #'evil-delete-buffer)
  (evil-global-set-key 'normal (kbd "<leader> b n") #'evil-next-buffer)
  (evil-global-set-key 'normal (kbd "<leader> b p") #'evil-next-buffer)

  (evil-global-set-key 'normal (kbd "<leader> s f") #'my/counsel-project-files)
  (evil-global-set-key 'normal (kbd "<leader> s r") #'counsel-recentf)
  (evil-global-set-key 'normal (kbd "<leader> s c") #'my/counsel-project-rg)
  (evil-global-set-key 'normal (kbd "<leader> s h") #'counsel-describe-function)
  (evil-global-set-key 'normal (kbd "<leader> s k") #'counsel-descbinds)
  (evil-global-set-key 'normal (kbd "<leader> SPC") #'ivy-switch-buffer)
  (evil-global-set-key 'normal (kbd "<leader> s m") #'counsel-evil-mark)
  (evil-global-set-key 'normal (kbd "<leader> s C") #'my/counsel-emacs-config-files)
  (evil-global-set-key 'normal (kbd "<leader> s b") #'swiper-isearch)

  (evil-global-set-key 'normal (kbd "<leader> s s") #'imenu)
  (evil-global-set-key 'normal (kbd "<leader> s d") #'flymake-show-buffer-diagnostics)

  (evil-global-set-key 'normal (kbd "g r n") #'eglot-rename)
  (evil-global-set-key 'normal (kbd "g r a") #'eglot-code-actions)
  (evil-global-set-key 'normal (kbd "g r D") #'eglot-find-declaration)
  (evil-global-set-key 'normal (kbd "g r d") #'xref-find-definitions)
  (evil-global-set-key 'normal (kbd "g r r") #'xref-find-references)
  (evil-global-set-key 'normal (kbd "g r i") #'eglot-find-implementation)
  (evil-global-set-key 'normal (kbd "g r t") #'eglot-find-typeDefinition)
  (evil-global-set-key 'normal (kbd "g r q") #'eglot-code-action-quickfix)
  (evil-global-set-key 'normal (kbd "g r f") #'eglot-format-buffer)
  (evil-global-set-key 'normal (kbd "] d") #'flymake-goto-next-error)
  (evil-global-set-key 'normal (kbd "[ d") #'flymake-goto-prev-error)
  (evil-global-set-key 'normal "K" #'my-eldoc-toggle)

  (evil-global-set-key 'normal (kbd "-") #'dired-jump)

  (with-eval-after-load 'ivy
    (define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
    (evil-define-key '(normal insert) ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit))
)

(provide 'keymap-evil)
