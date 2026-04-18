;; load theme
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'noctalia t)

;; set font
(defun my/setup-fonts (&optional frame)
  (with-selected-frame (or frame (selected-frame))
    (set-face-attribute 'default nil
                        :family "SauceCodePro Nerd Font Mono"
                        :height 125)
    (dolist (charset '(han kana cjk-misc))
      (set-fontset-font t charset
                        (font-spec :family "LXGW WenKai Mono"
                                   :height 130)))))

(if (daemonp)
    (add-hook 'after-make-frame-functions #'my/setup-fonts)
  (my/setup-fonts))

;; ui config
(blink-cursor-mode -1)
