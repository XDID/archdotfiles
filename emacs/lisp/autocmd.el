;; input method
(defvar my-im-status "keyboard-us")

(defun my-fcitx-save-and-switch-to-english ()
  (setq my-im-status (string-trim (shell-command-to-string "fcitx5-remote -n")))
  (call-process "fcitx5-remote" nil nil nil "-s" "keyboard-us"))

(defun my-fcitx-restore-chinese-im ()
  (when (and my-im-status (not (string= my-im-status "keyboard-us")))
    (call-process "fcitx5-remote" nil nil nil "-s" my-im-status)))

(with-eval-after-load 'evil
  (add-hook 'evil-insert-state-exit-hook #'my-fcitx-save-and-switch-to-english)
  (add-hook 'evil-insert-state-entry-hook #'my-fcitx-restore-chinese-im))
