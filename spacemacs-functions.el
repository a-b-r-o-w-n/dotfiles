(defun eslint-set-closest (&optional dir)
  (interactive)
  (let ((dir (or dir default-directory))
        (eslintrc (concat dir "/.eslintrc")))
    (if (file-exists-p eslintrc)
        (progn
          (make-variable-buffer-local 'flycheck-eslintrc)
          (make-variable-buffer-local 'flycheck-javascript-eslint-executable)
          (setq flycheck-eslintrc eslintrc)
          (setq flycheck-javascript-eslint-executable
                (concat dir "/node_modules/.bin/eslint")))
      (if (string= dir "/") nil
        (eslint-set-closest (expand-file-name ".." dir))))))

(defun auto-make-directory ()
  (let ((dir (file-name-directory (buffer-file-name))))
    (unless (file-readable-p dir)
      (make-directory dir t))))

(provide 'spacemacs-functions)
