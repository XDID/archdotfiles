;;; ivy-config.el --- Ivy/Counsel/Swiper setup -*- lexical-binding: t; -*-

(require 'project)
(require 'recentf)

(defun my/project-root ()
  (when-let ((project (project-current nil)))
    (expand-file-name (project-root project))))

(defun my/counsel--directory (directory)
  (let ((directory (expand-file-name directory)))
    (unless (file-directory-p directory)
      (user-error "Directory not found: %s" directory))
    directory))

(defun my/counsel-find-files-in-directory (directory)
  (let ((default-directory (my/counsel--directory directory)))
    (if (and (executable-find "fzf") (executable-find "fd"))
        (counsel-fzf nil default-directory)
      (counsel-file-jump nil default-directory))))

(defun my/counsel-rg-in-directory (directory)
  (let ((default-directory (my/counsel--directory directory)))
    (unless (executable-find "rg")
      (user-error "ripgrep (rg) not found"))
    (counsel-rg nil default-directory)))

(defun my/counsel-project-files ()
  (interactive)
  (my/counsel-find-files-in-directory
   (or (my/project-root) default-directory)))

(defun my/counsel-project-rg ()
  (interactive)
  (my/counsel-rg-in-directory
   (or (my/project-root) default-directory)))

(defun my/counsel-emacs-config-files ()
  (interactive)
  (my/counsel-find-files-in-directory user-emacs-directory))

(defun my/counsel-emacs-config-rg ()
  (interactive)
  (my/counsel-rg-in-directory user-emacs-directory))

(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-wrap t
        ivy-initial-inputs-alist nil
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((swiper . ivy--regex-plus)
                                (t . ivy--regex-ignore-order)))
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :after ivy
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (setq recentf-max-saved-items 200
        recentf-auto-cleanup 'never
        recentf-exclude '("/elpa/" "/eln-cache/" "/auto-save-list/" "/tmp/"))
  (recentf-mode 1)
  (counsel-mode 1))

(use-package swiper
  :ensure t
  :after ivy)

(use-package ivy-rich
  :ensure t
  :after ivy
  :config
  (ivy-rich-mode 1))

(provide 'ivy-config)
