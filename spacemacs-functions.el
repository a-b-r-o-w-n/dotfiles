(defun eslint-set-closest-executable (&optional dir)
  (interactive)
  (let* ((dir (or dir default-directory))
         (eslint-executable (concat dir "/node_modules/.bin/eslint")))
    (if (file-exists-p eslint-executable)
        (progn
          (make-variable-buffer-local 'flycheck-javascript-eslint-executable)
          (setq flycheck-javascript-eslint-executable eslint-executable))
      (if (string= dir "/") nil
        (eslint-set-closest-executable (expand-file-name ".." dir))))))

(defun auto-make-directory ()
  (let ((dir (file-name-directory (buffer-file-name))))
    (unless (file-readable-p dir)
      (make-directory dir t))))

(provide 'spacemacs-functions)
