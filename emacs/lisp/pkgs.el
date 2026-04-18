;; config pkgs
(require 'package)
(setq package-archives
      '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu")))
(unless (bound-and-true-p package--initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(require 'seq)
(require 'use-package)
(setq use-package-always-ensure t)

;; which-key
(use-package which-key
  :init
  (which-key-mode 1)
  :custom
  (which-key-idle-delay 0.3))

;; minibuffer completion and search
(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

(use-package recentf
  :ensure nil
  :init
  (recentf-mode 1)
  :custom
  (recentf-max-saved-items 200)
  (recentf-auto-cleanup 'never)
  :config
  (dolist (path '("/tmp/" "/ssh:" "/sudo:"))
    (add-to-list 'recentf-exclude path)))

(use-package vertico
  :init
  (vertico-mode 1)
  :custom
  (vertico-cycle t))

(use-package marginalia
  :init
  (marginalia-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-s r" . consult-ripgrep)))

(use-package consult-eglot
  :after (consult eglot))

;; dired
(use-package dired
  :ensure nil
  :custom
  (dired-listing-switches "-alh --group-directories-first")
  (dired-dwim-target t)
  (dired-hide-details-hide-symlink-targets nil)
  (delete-by-moving-to-trash t)
  (wdired-allow-to-change-permissions t)
  (wdired-create-parent-directories t)
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'top)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))

;; tree-sitter
(defconst my/treesit-dir (expand-file-name "treesitter/" user-emacs-directory))
(unless (file-directory-p my/treesit-dir)
  (make-directory my/treesit-dir t))
(add-to-list 'treesit-extra-load-path my/treesit-dir)

(when (treesit-available-p)
  (setq treesit-language-source-alist
        '((bash "https://github.com/tree-sitter/tree-sitter-bash")
          (go "https://github.com/tree-sitter/tree-sitter-go")
          (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (lua "https://github.com/tree-sitter-grammars/tree-sitter-lua")
          (rust "https://github.com/tree-sitter/tree-sitter-rust")
          (toml "https://github.com/tree-sitter/tree-sitter-toml")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (yaml "https://github.com/ikatyang/tree-sitter-yaml")
          (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown")))

  (setq major-mode-remap-alist
        '((bash-mode . bash-ts-mode)
          (sh-mode . bash-ts-mode)
          (go-mode . go-ts-mode)
          (python-mode . python-ts-mode)
          (js-mode . js-ts-mode)
          (json-mode . json-ts-mode)
          (css-mode . css-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (lua-mode . lua-ts-mode)
          (rust-mode . rust-ts-mode)
          (yaml-mode . yaml-ts-mode))))

(defun my/install-treesit-grammars ()
  (interactive)
  (dolist (grammar '(bash go gomod python lua rust toml json yaml markdown))
    (unless (treesit-language-available-p grammar)
      (treesit-install-language-grammar grammar my/treesit-dir))))

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

;; completion UI
(use-package corfu
  :init
  (global-corfu-mode 1)
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.1)
  (corfu-preview-current nil)
  (corfu-cycle t)
  :config
  (corfu-history-mode 1)
  (corfu-popupinfo-mode 1))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(defun my/resolve-lsp-server (&rest commands)
  (seq-find (lambda (command)
              (executable-find (car command)))
            commands))

(defun my/python-lsp-server ()
  (or (my/resolve-lsp-server
       '("basedpyright-langserver" "--stdio")
       '("pyright-langserver" "--stdio")
       '("pylsp"))
      (list "python3" "-m" "pylsp")))

;; lsp
(use-package eglot
  :ensure nil
  :hook ((rust-mode . eglot-ensure)
         (rust-ts-mode . eglot-ensure)
         (go-mode . eglot-ensure)
         (go-ts-mode . eglot-ensure)
         (python-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure)
         (sh-mode . eglot-ensure)
         (bash-ts-mode . eglot-ensure)
         (lua-mode . eglot-ensure)
         (lua-ts-mode . eglot-ensure)
         (eglot-managed-mode . my/eglot-managed-mode-setup))
  :bind (:map eglot-mode-map
              ("M-." . xref-find-definitions)
              ("M-?" . xref-find-references)
              ("M-," . xref-go-back)
              ("C-c r" . eglot-rename)
              ("C-c a" . eglot-code-actions)
              ("C-c f" . eglot-format-buffer))
  :config
  (setq eglot-autoshutdown t)
  (setq eglot-sync-connect 1)
  (setq eglot-confirm-server-initiated-edits nil)
  (setq eglot-report-progress nil)
  (add-to-list 'eglot-server-programs
               '((rust-mode rust-ts-mode) . ("rust-analyzer")))
  (add-to-list 'eglot-server-programs
               '((go-mode go-ts-mode) . ("gopls")))
  (add-to-list 'eglot-server-programs
               `((python-mode python-ts-mode) . ,(my/python-lsp-server)))
  (add-to-list 'eglot-server-programs
               '((sh-mode bash-ts-mode) . ("bash-language-server" "start")))
  (add-to-list 'eglot-server-programs
               '((lua-mode lua-ts-mode) . ("lua-language-server"))))

(defun my/eglot-format-buffer-on-save ()
  (remove-hook 'before-save-hook #'eglot-format-buffer t)
  (add-hook 'before-save-hook #'eglot-format-buffer nil t))

(defun my/eglot-managed-mode-setup ()
  (setq-local completion-category-defaults nil)
  (setq-local completion-category-overrides '((eglot (styles orderless basic))))
  (eldoc-mode 1)
  (flymake-mode 1)
  (my/eglot-format-buffer-on-save))

;; language modes
(use-package rust-mode
  :mode "\\.rs\\'")

(use-package go-mode
  :mode "\\.go\\'")

(use-package lua-mode
  :mode "\\.lua\\'")
