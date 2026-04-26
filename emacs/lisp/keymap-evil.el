;;; keymap-evil.el --- Evil key bindings -*- lexical-binding: t; -*-

(defun my/evil-force-quit ()
  (interactive)
  (evil-quit t))

(with-eval-after-load 'evil
  (evil-set-leader '(normal visual motion) (kbd "SPC"))

  (evil-global-set-key 'normal (kbd ":") #'execute-extended-command)
  (evil-global-set-key 'visual (kbd ":") #'execute-extended-command)
  (evil-global-set-key 'motion (kbd ":") #'execute-extended-command)

  (evil-global-set-key 'normal (kbd "<leader> q") #'evil-quit)
  (evil-global-set-key 'visual (kbd "<leader> q") #'evil-quit)
  (evil-global-set-key 'motion (kbd "<leader> q") #'evil-quit)

  (evil-global-set-key 'normal (kbd "<leader> Q") #'my/evil-force-quit)
  (evil-global-set-key 'visual (kbd "<leader> Q") #'my/evil-force-quit)
  (evil-global-set-key 'motion (kbd "<leader> Q") #'my/evil-force-quit)

  (evil-global-set-key 'normal (kbd "C-s") #'save-buffer)
  (evil-global-set-key 'insert (kbd "C-s")
                     (lambda () (interactive) (save-buffer) (evil-normal-state)))
  (evil-global-set-key 'visual (kbd "C-s")
                     (lambda () (interactive) (save-buffer) (evil-normal-state)))


  (evil-global-set-key 'normal (kbd "<leader> s f") #'my/counsel-project-files)
  (evil-global-set-key 'normal (kbd "<leader> s r") #'counsel-recentf)
  (evil-global-set-key 'normal (kbd "<leader> s C") #'my/counsel-emacs-config-files)
  (evil-global-set-key 'normal (kbd "<leader> s c") #'my/counsel-project-rg)
  (evil-global-set-key 'normal (kbd "<leader> SPC") #'ivy-switch-buffer)
  (evil-global-set-key 'normal (kbd "<leader> s b") #'swiper-isearch)
  (evil-global-set-key 'normal (kbd "<leader> s k") #'counsel-descbinds)
  (evil-global-set-key 'normal (kbd "<leader> s h") #'counsel-describe-function)

  (evil-global-set-key 'normal (kbd "-") #'dired-jump)

  (with-eval-after-load 'ivy
    (define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
    (evil-define-key '(normal insert) ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit))
)

(provide 'keymap-evil)
