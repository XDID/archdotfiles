;;; ui.el --- UI settings -*- lexical-binding: t; -*-

(defconst my/default-font-family "Sarasa Term SC Nerd")
(defconst my/default-font-height 155)
(defconst my/cjk-font-family "LXGW WenKai Mono")
(defconst my/cjk-font-size 16.5)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(global-hl-line-mode 1)
(setq ring-bell-function 'ignore)

(defun my/apply-fonts (&optional frame)
  (let ((frame (or frame (selected-frame)))
        (latin-font (font-spec :family my/default-font-family
                               :size 15.5))
        (cjk-font (font-spec :family my/cjk-font-family
                             :size my/cjk-font-size)))
    (when (display-graphic-p frame)
      (set-face-attribute 'default frame
                          :font latin-font
                          :height my/default-font-height)
      (set-fontset-font nil 'han cjk-font frame)
      (set-fontset-font nil 'cjk-misc cjk-font frame))))

;; Make future frames inherit the expected Latin font before hooks run.
(add-to-list 'default-frame-alist
             `(font . ,(format "%s-%s"
                               my/default-font-family
                               (/ my/default-font-height 10.0))))

;; Set defaults for future frames and apply to any current GUI frame.
(set-face-attribute 'default t
                    :family my/default-font-family
                    :height my/default-font-height)
(set-fontset-font t 'han
                  (font-spec :family my/cjk-font-family
                             :size my/cjk-font-size))
(set-fontset-font t 'cjk-misc
                  (font-spec :family my/cjk-font-family
                             :size my/cjk-font-size))

(add-hook 'after-make-frame-functions #'my/apply-fonts)
(add-hook 'server-after-make-frame-hook #'my/apply-fonts)
(my/apply-fonts)

(provide 'ui)
