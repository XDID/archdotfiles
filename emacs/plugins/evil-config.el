(use-package evil
  :init
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode 1))

(provide 'evil-config)
