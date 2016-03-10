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

(defun split-window-sensibly (&optional window)
  "Split WINDOW in a way suitable for `display-buffer'.
WINDOW defaults to the currently selected window.
If `split-height-threshold' specifies an integer, WINDOW is at
least `split-height-threshold' lines tall and can be split
vertically, split WINDOW into two windows one above the other and
return the lower window.  Otherwise, if `split-width-threshold'
specifies an integer, WINDOW is at least `split-width-threshold'
columns wide and can be split horizontally, split WINDOW into two
windows side by side and return the window on the right.  If this
can't be done either and WINDOW is the only window on its frame,
try to split WINDOW vertically disregarding any value specified
by `split-height-threshold'.  If that succeeds, return the lower
window.  Return nil otherwise.

By default `display-buffer' routines call this function to split
the largest or least recently used window.  To change the default
customize the option `split-window-preferred-function'.

You can enforce this function to not split WINDOW horizontally,
by setting (or binding) the variable `split-width-threshold' to
nil.  If, in addition, you set `split-height-threshold' to zero,
chances increase that this function does split WINDOW vertically.

In order to not split WINDOW vertically, set (or bind) the
variable `split-height-threshold' to nil.  Additionally, you can
set `split-width-threshold' to zero to make a horizontal split
more likely to occur.

Have a look at the function `window-splittable-p' if you want to
know how `split-window-sensibly' determines whether WINDOW can be
split."
  (let ((window (or window (selected-window))))
    (or (and (window-splittable-p window t)
             ;; Split window horizontally.
             (with-selected-window window
               (split-window-right)))
        (and (window-splittable-p window)
             ;; Split window vertically.
             (with-selected-window window
               (split-window-below)))
        (and (eq window (frame-root-window (window-frame window)))
             (not (window-minibuffer-p window))
             ;; If WINDOW is the only window on its frame and is not the
             ;; minibuffer window, try to split it vertically disregarding
             ;; the value of `split-height-threshold'.
             (let ((split-height-threshold 0))
               (when (window-splittable-p window)
                 (with-selected-window window
                   (split-window-below))))))))

(defun load-shell-env (command)
  (interactive)
  (set
   (make-local-variable 'process-environment)
   (split-string
    (shell-command-to-string
     command)
    "\n")))

(defun copy-word ()
  (interactive)
  (kill-new (thing-at-point 'word)))

(defun mocha-remove-only ()
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (replace-string ".only" "")))

(defun mocha-add-only ()
  (interactive)
  (let ((mocha-pattern "\\(^\s*describe\\|^\s*context\\|^\s*it\\)"))
    (save-excursion
      (if (search-backward-regexp mocha-pattern nil t)
          (progn
            (forward-word)
            (insert ".only"))
        (progn
          (search-forward-regexp mocha-pattern)
          (insert ".only"))))))

(defun mocha-add-or-remove-only ()
  (interactive)
  (if (string-match ".only" (buffer-string))
      (mocha-remove-only)
    (mocha-add-only))
  (force-save))

(provide 'spacemacs-functions)
