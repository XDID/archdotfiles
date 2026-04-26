(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugins" user-emacs-directory))

; lisp
(require 'packages)
(require 'ui)
(require 'basic)

; pkgs
(require 'colorscheme)
(require 'evil-config)
(require 'im-config)
(require 'flash-config)
(require 'ivy-config)
(require 'dired-config)
(require 'treesitter-config)
(require 'eglot-config)
(require 'keymap-evil)
(require 'which-config)
