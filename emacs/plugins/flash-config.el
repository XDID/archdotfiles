(use-package flash
  :after evil
  :demand t
  :commands (flash-jump flash-jump-continue flash-treesitter)
  :custom
  (flash-multi-window t)
  (flash-autojump t)
  :config
  (require 'flash-evil)
  (require 'flash-isearch)
  (flash-evil-setup t)
  (flash-isearch-mode 1)
  (evil-global-set-key 'normal (kbd "s") #'flash-evil-jump)
  (evil-global-set-key 'visual (kbd "s") #'flash-evil-jump)
  (evil-global-set-key 'operator (kbd "S") #'flash-evil-jump))

(provide 'flash-config)
