(use-package multiple-cursors
    :ensure t
    :bind (
        ("C->"     . mc/mark-next-like-this)
        ("C-<"     . mc/mark-previous-like-this)
        ("C-c C->" . mc/mark-all-like-this)
        ("C-M->"   . mc/skip-to-next-like-this)
        ("C-M-<"   . mc/skip-to-previous-like-this))
  :config
    (setq mc/always-run-for-all t)
    (setq mc/insert-numbers-default nil))

(provide 'multi-cursor-config)
