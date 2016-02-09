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

(with-eval-after-load 'projectile
  (defun projectile-test-suffix (project-type)
    "Find default test files suffix based on PROJECT-TYPE."
    (cond
     ((member project-type '(emacs-cask)) "-test")
     ((member project-type '(rails-rspec ruby-rspec)) "_spec")
     ((member project-type '(rails-test ruby-test lein-test boot-clj go)) "_test")
     ((member project-type '(scons)) "test")
     ((member project-type '(maven symfony)) "Test")
     ((member project-type '(gulp npm)) "Spec")
     ((member project-type '(gradle gradlew grails)) "Spec"))))

(defun load-shell-env (command)
  (interactive)
  (set
   (make-local-variable 'process-environment)
   (split-string
    (shell-command-to-string
     command)
    "\n")))

(provide 'spacemacs-functions)
