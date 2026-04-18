(require 'evil)
(require 'project)

(defvar my/leader-map (make-sparse-keymap)
  "Leader keymap bound to SPC in evil states.")

(define-prefix-command 'my/search-map)
(define-key my/leader-map (kbd "s") 'my/search-map)

(defun my/open-dired ()
  (interactive)
  (if buffer-file-name
      (dired-jump)
    (dired default-directory)))

(defun my/dired-create-empty-file (file)
  (interactive
   (list (read-file-name "Create file: " (dired-current-directory))))
  (make-directory (file-name-directory file) t)
  (write-region "" nil file nil 0)
  (revert-buffer)
  (dired-goto-file file))

(defun my/dired-create-directory (dir)
  (interactive
   (list (read-directory-name "Create directory: " (dired-current-directory))))
  (make-directory dir t)
  (revert-buffer)
  (dired-goto-file dir))

(defun my/project-root ()
  (if-let ((project (project-current nil)))
      (project-root project)
    default-directory))

(defun my/project-find-file ()
  (interactive)
  (let ((default-directory (my/project-root)))
    (cond
     ((executable-find "fd") (consult-fd default-directory))
     ((executable-find "fdfind") (let ((consult-fd-args "fdfind --color=never --full-path ARG OPTS"))
                                   (consult-fd default-directory)))
     (t (consult-find default-directory)))))

(defun my/project-ripgrep ()
  (interactive)
  (consult-ripgrep (my/project-root)))

(defun my/config-find-file ()
  (interactive)
  (let ((default-directory user-emacs-directory))
    (cond
     ((executable-find "fd") (consult-fd default-directory))
     ((executable-find "fdfind") (let ((consult-fd-args "fdfind --color=never --full-path ARG OPTS"))
                                   (consult-fd default-directory)))
     (t (consult-find default-directory)))))

(defun my/buffer-or-imenu ()
  (interactive)
  (if (derived-mode-p 'prog-mode 'text-mode 'conf-mode)
      (consult-imenu)
    (consult-buffer)))

(defun my/workspace-symbols ()
  (interactive)
  (if (and (bound-and-true-p eglot-managed-mode)
           (fboundp 'consult-eglot-symbols))
      (consult-eglot-symbols)
    (consult-imenu-multi)))

(defun my/show-doc-at-point ()
  (interactive)
  (if (bound-and-true-p eglot-managed-mode)
      (eldoc-doc-buffer)
    (call-interactively #'man)))

(defun my/save-buffer-and-normal-state ()
  (interactive)
  (save-buffer)
  (evil-normal-state))

(defun my/swap-window-with-direction (direction)
  (let ((other-window (windmove-find-other-window direction)))
    (when other-window
      (window-swap-states (selected-window) other-window)
      (select-window other-window))))

(defun my/swap-window-left ()
  (interactive)
  (my/swap-window-with-direction 'left))

(defun my/swap-window-right ()
  (interactive)
  (my/swap-window-with-direction 'right))

(defun my/swap-window-down ()
  (interactive)
  (my/swap-window-with-direction 'down))

(defun my/swap-window-up ()
  (interactive)
  (my/swap-window-with-direction 'up))

(define-prefix-command 'my/tab-map)
(define-key my/leader-map (kbd "t") 'my/tab-map)

(define-prefix-command 'my/find-map)
(define-key my/leader-map (kbd "f") 'my/find-map)

(define-key my/leader-map (kbd "SPC") #'consult-buffer)

(define-key my/leader-map (kbd "q") #'delete-window)
(define-key my/leader-map (kbd "Q") #'kill-buffer-and-window)
(define-key my/leader-map (kbd "d") #'flymake-show-buffer-diagnostics)
(define-key my/find-map (kbd "f") #'eglot-format-buffer)

(define-key my/search-map (kbd "f") #'my/project-find-file)
(define-key my/search-map (kbd "r") #'consult-recent-file)
(define-key my/search-map (kbd "c") #'my/project-ripgrep)
(define-key my/search-map (kbd "h") #'consult-man)
(define-key my/search-map (kbd "k") #'consult-keymap)
(define-key my/search-map (kbd "m") #'consult-mark)
(define-key my/search-map (kbd "s") #'my/buffer-or-imenu)
(define-key my/search-map (kbd "S") #'my/workspace-symbols)
(define-key my/search-map (kbd "b") #'consult-line)
(define-key my/search-map (kbd "d") #'consult-flymake)
(define-key my/search-map (kbd "C") #'my/config-find-file)

(define-key my/tab-map (kbd "n") #'tab-bar-new-tab)
(define-key my/tab-map (kbd "c") #'tab-bar-close-tab)
(define-key my/tab-map (kbd "o") #'tab-bar-close-other-tabs)
(define-key my/tab-map (kbd "]") #'tab-bar-switch-to-next-tab)
(define-key my/tab-map (kbd "[") #'tab-bar-switch-to-prev-tab)

(evil-define-key '(normal visual motion) 'global
  (kbd "SPC") my/leader-map
  (kbd "s") #'flash-jump
  (kbd "S") #'flash-treesitter
  (kbd "K") #'my/show-doc-at-point
  (kbd "|") #'split-window-right
  (kbd "\\") #'split-window-below
  (kbd "grn") #'eglot-rename
  (kbd "gra") #'eglot-code-actions
  (kbd "grD") #'eglot-find-declaration
  (kbd "grd") #'xref-find-definitions)

(evil-define-key 'normal 'global
  (kbd "<escape>") #'keyboard-quit
  (kbd "C-s") #'save-buffer
  (kbd "-") #'my/open-dired
  (kbd "C-h") #'windmove-left
  (kbd "C-l") #'windmove-right
  (kbd "C-j") #'windmove-down
  (kbd "C-k") #'windmove-up
  (kbd "C-S-h") #'my/swap-window-left
  (kbd "C-S-l") #'my/swap-window-right
  (kbd "C-S-j") #'my/swap-window-down
  (kbd "C-S-k") #'my/swap-window-up)

(evil-define-key 'insert 'global
  (kbd "C-s") #'my/save-buffer-and-normal-state)

(with-eval-after-load 'term
  (define-key term-raw-map (kbd "<escape><escape>") #'term-line-mode))

(with-eval-after-load 'dired
  (with-eval-after-load 'wdired
    (evil-define-key 'normal wdired-mode-map
      (kbd "ZZ") #'wdired-finish-edit
      (kbd "ZQ") #'wdired-abort-changes))
  (evil-define-key 'normal dired-mode-map
    (kbd "<return>") #'dired-find-file
    (kbd "<backspace>") #'dired-up-directory
    (kbd "h") #'dired-up-directory
    (kbd "gr") #'revert-buffer
    (kbd "R") #'wdired-change-to-wdired-mode
    (kbd "+") #'my/dired-create-empty-file
    (kbd "=") #'my/dired-create-directory
    (kbd "d") #'dired-flag-file-deletion
    (kbd "x") #'dired-do-flagged-delete
    (kbd "c") #'dired-do-copy
    (kbd "m") #'dired-do-rename
    (kbd "yy") #'dired-copy-filename-as-kill
    (kbd "q") #'quit-window))
