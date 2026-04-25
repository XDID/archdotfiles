(require 'subr-x)

(defconst my/fcitx5-active-state "2")
(defvar my/fcitx5-restore-p nil)

(defun my/fcitx5-call-string (&rest args)
  (when (executable-find "fcitx5-remote")
    (with-temp-buffer
      (let ((status (apply #'call-process "fcitx5-remote" nil t nil args)))
        (when (and (numberp status) (>= status 0))
          (string-trim (buffer-string)))))))

(defun my/fcitx5-active-p ()
  (string= (my/fcitx5-call-string) my/fcitx5-active-state))

(defun my/save-im-and-switch-to-english ()
  (setq my/fcitx5-restore-p (my/fcitx5-active-p))
  (when my/fcitx5-restore-p
    (my/fcitx5-call-string "-c")))

(defun my/restore-im ()
  (when my/fcitx5-restore-p
    (my/fcitx5-call-string "-o")
    (setq my/fcitx5-restore-p nil)))

(with-eval-after-load 'evil
  (add-hook 'evil-insert-state-exit-hook #'my/save-im-and-switch-to-english)
  (add-hook 'evil-insert-state-entry-hook #'my/restore-im))

(provide 'im-config)
