;; adjust window size in niri or maybe all wayland compositor
(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)

;; hide redundant elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; remove startup page
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)

;; set alpha background
(set-frame-parameter nil 'alpha-background 85)
(add-to-list 'default-frame-alist '(alpha-background . 85))
