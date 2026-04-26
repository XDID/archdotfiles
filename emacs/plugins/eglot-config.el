(add-hook 'prog-mode-hook #'eglot-ensure)

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (setq-local company-backends
                        (cons '(company-capf :with company-dabbrev-code)
                              (cl-remove 'company-capf company-backends :test #'equal)))
            (eglot-code-lens-mode 1)))

(setq eglot-server-programs
      '((python-ts-mode . ("pylsp"))
        (rust-ts-mode   . ("rust-analyzer"))
        (c-ts-mode      . ("clangd"))
        (bash-ts-mode   . ("bash-language-server start"))
        (c++-ts-mode    . ("clangd"))))

;; auto completion
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 1)
  (corfu-cycle t)
  :init
  (global-corfu-mode))

(use-package cape
  :ensure t
  :after corfu
  :config
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-ispell))

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

(defun my/minibuffer-setup-capf ()
  (when (boundp 'completion-at-point-functions)
    (setq-local completion-at-point-functions
                (append completion-at-point-functions
                        '(cape-file cape-dabbrev)))))
(add-hook 'minibuffer-setup-hook #'my/minibuffer-setup-capf)

(with-eval-after-load 'corfu
  (evil-global-set-key 'normal (kbd "TAB") #'corfu-insert)
  (evil-global-set-key 'normal (kbd "<tab>") #'corfu-insert)
  (evil-global-set-key 'normal (kbd "C-n") #'corfu-next)
  (evil-global-set-key 'normal (kbd "C-p") #'corfu-previous))

(provide 'eglot-config)
