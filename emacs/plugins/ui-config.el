(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

(use-package emojify
  :hook
  (after-init . global-emojify-mode)
  :init
  (setq emojify-emoji-styles '(unicode github)))

(use-package all-the-icons)

(provide 'ui-config)
