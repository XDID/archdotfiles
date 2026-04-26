(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugins" user-emacs-directory))

; lisp
(require 'packages)
(require 'ui)
(require 'basic)

; pkgs
(require 'evil-config)
(require 'colorscheme)
(require 'im-config)
(require 'flash-config)
(require 'ivy-config)
(require 'dired-config)
(require 'lsp-config)
(require 'keymap-evil)
