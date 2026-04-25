(use-package kanagawa-themes
  :ensure t
  :init
  (setq custom-safe-themes t))

(defun my/server-auto-dark (frame)
  (with-selected-frame frame
    (when (display-graphic-p)
      (auto-dark-mode 1)
      (remove-hook 'after-make-frame-functions #'my/server-auto-dark))))

(use-package auto-dark
  :ensure t
  :custom
  (auto-dark-themes '((kanagawa-wave) (kanagawa-lotus)))
  (auto-dark-polling-interval-seconds 5)
  (auto-dark-allow-osascript nil)
  (auto-dark-allow-powershell nil)
  ;; (auto-dark-detection-method nil) ;; dangerous to be set manually
  :hook
  (auto-dark-dark-mode
   . (lambda ()
        ;; something to execute when dark mode is detected
        ))
  (auto-dark-light-mode
   . (lambda ()
        ;; something to execute when light mode is detected
        ))
  :config
  (setq auto-dark-themes '((kanagawa-wave) (kanagawa-lotus)))
  (add-hook 'after-make-frame-functions #'my/server-auto-dark)
  :init (auto-dark-mode))

(provide 'colorscheme)
