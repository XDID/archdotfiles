;; load theme
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'noctalia t)

;; set font
(defconst my/latin-font-family "Sarasa Mono SC")
(defconst my/cjk-font-family "LXGW WenKai Mono")
(defconst my/default-font-height 125)
(defconst my/cjk-font-height 138)

(defun my/setup-fonts (&optional frame)
  (let ((target-frame (or frame (selected-frame))))
    (when (and (frame-live-p target-frame)
               (display-graphic-p target-frame))
      (with-selected-frame target-frame
        (set-face-attribute 'default target-frame
                            :family my/latin-font-family
                            :height my/default-font-height)
        (let ((cjk-font-spec (font-spec :family my/cjk-font-family
                                        :size (/ my/cjk-font-height 10.0))))
          (when (find-font cjk-font-spec)
            ;; Apply to the frame's actual fontset instead of the shared default
            ;; fontset. This is more reliable for daemon-created client frames.
            (dolist (charset '(han cjk-misc kana bopomofo))
              (set-fontset-font nil charset cjk-font-spec target-frame))))
        (redraw-frame target-frame)))))

(defun my/setup-fonts-for-new-frame (&optional frame)
  (let ((target-frame (or frame (selected-frame))))
    (my/setup-fonts target-frame)
  ;; Daemon client frames can finish font initialization slightly after the
  ;; frame hooks run, so apply once more on the next idle turn.
    (run-with-idle-timer 0 nil #'my/setup-fonts target-frame)))

(defun my/setup-default-fonts ()
  (set-face-attribute 'default nil
                      :family my/latin-font-family
                      :height my/default-font-height))

(my/setup-default-fonts)
(add-hook 'after-init-hook #'my/setup-fonts)
(add-hook 'after-make-frame-functions #'my/setup-fonts-for-new-frame)
(add-hook 'server-after-make-frame-hook #'my/setup-fonts-for-new-frame)

;; line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(dolist (hook '(term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                vterm-mode-hook
                eat-mode-hook
                comint-mode-hook
                compilation-mode-hook
                help-mode-hook
                helpful-mode-hook
                special-mode-hook))
  (add-hook hook (lambda () (display-line-numbers-mode 0))))

;; ui config
(blink-cursor-mode -1)
