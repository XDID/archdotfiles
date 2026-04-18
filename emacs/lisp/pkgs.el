;; config pkgs
(require 'package)
(setq package-archives
      '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; evil config
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(setq evil-default-state 'normal)

;; flash config
(use-package flash
  :commands (flash-jump flash-jump-continue
             flash-treesitter)
  :custom
  (flash-multi-window t)
  :init
  (with-eval-after-load 'evil
    (require 'flash-evil)
    (flash-evil-setup t))  ; t = also set up f/t/F/T char motions
  :config
  ;; Search integration (labels during C-s, /, ?)
  (require 'flash-isearch)
  (flash-isearch-mode 1))
