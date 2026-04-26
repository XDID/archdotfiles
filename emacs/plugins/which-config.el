(use-package which-key
  :ensure t
  :defer 0.1
  :diminish which-key-mode
  :init
  (which-key-mode)
  :custom
  (which-key-idle-delay 0.5)
  (which-key-idle-secondary-delay 0.01)
  (which-key-max-display-columns nil)
  (which-key-separator " → ")
  (which-key-add-column-padding 1)
  (which-key-max-description-length 40)
  (which-key-side-window-location 'bottom)
  (which-key-side-window-max-height 0.25)
  :config
  (setq which-key-allow-imperfect-match t)

  (with-eval-after-load 'evil
    (which-key-mode 1))

  (add-hook 'minibuffer-setup-hook #'which-key--hide-popup-ignore-command))

(provide 'which-config)
