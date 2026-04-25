(use-package dired
  :ensure nil        ; dired 是内置包，无需安装
  :hook
  (dired-mode . dired-auto-revert-buffer)
  :config
  (setq dired-dwim-target t)
  (setq dired-listing-switches "-alh --group-directories-first -v")
  (setq dired-recursive-deletes 'top)
  (setq dired-create-destination-dirs 'always)
  (defun dired-ediff-files ()
    (interactive)
    (require 'dired-aux)
    (let ((files (dired-get-marked-files)))
      (if (<= (length files) 2)
          (let ((file1 (car files))
                (file2 (if (cdr files) (cadr files)
                         (read-file-name "Diff with file: "))))
            (ediff-files file1 file2))
        (error "最多只能标记两个文件进行对比")))))

(use-package dired-x
  :ensure nil
  :after dired
  :config
  (setq dired-omit-mode t)
  (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))) ; 默认会隐藏 `.` 开头的文件

(provide 'dired-config)
