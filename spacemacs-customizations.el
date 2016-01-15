;; keybindings
(define-key key-translation-map "\C-j" "\C-x")
(global-set-key (kbd "M-\\") 'spacemacs/comment-or-uncomment-lines)
(global-set-key (kbd "C-x C-s") 'force-save)
(global-set-key (kbd "C-,") 'spacemacs/indent-region-or-buffer)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)
(global-set-key (kbd "S-<backspace>") 'pop-to-mark-command)
(global-set-key (kbd "M-P") 'md/duplicate-up)
(global-set-key (kbd "M-N") 'md/duplicate-down)
(global-set-key (kbd "C-S-p") 'md/move-lines-up)
(global-set-key (kbd "C-S-n") 'md/move-lines-down)
(global-set-key (kbd "M-C-h") 'evil-window-left)
(global-set-key (kbd "M-C-l") 'evil-window-right)
(global-set-key (kbd "M-C-k") 'evil-window-up)
(global-set-key (kbd "M-C-j") 'evil-window-down)

;; settings
(setq-default
 js-indent-level 2
 magit-commit-arguments (quote ("--verbose"))
 magit-fetch-arguments (quote ("--prune"))
 magit-pull-arguments nil
 magit-push-arguments (quote ("--set-upstream"))
 magit-save-repository-buffers nil
 mac-command-modifier 'meta
 css-indent-offset 2
 delete-selection-mode t
 global-evil-search-highlight-persist nil
 ido-auto-merge-delay-time 5
 projectile-enable-caching nil
 projectile-git-command "ag --nocolor -l -g \"\""
 scss-sass-command "/Users/andy/\.rvm/gems/ruby-2\.1\.5@poc-oliver/bin/sass"
 projectile-switch-project-action 'projectile-dired
 evil-ex-search-persistent-highlight nil
 )

(global-vi-tilde-fringe-mode nil)
(global-linum-mode 1)

(add-hook 'term-mode-hook 'spacemacs/toggle-line-numbers-off)

;; js2-mode config
(add-hook 'js2-mode-hook 'spacemacs/toggle-syntax-checking-on)
(add-hook 'js2-mode-hook (lambda ()
                           (eslint-set-closest)
                           (tern-mode -1)))
(setq-default company-backends-js2-mode '((company-tern :with company-dabbrev)
                                          company-files
                                          company-dabbrev))

;; web-mode config
(add-hook 'web-mode-hook (lambda ()
                           (eslint-set-closest)))

;; magit config
(add-hook 'git-commit-mode-hook
          (lambda () (local-set-key (kbd "C-x C-s") 'with-editor-finish)))
(setq
 magit-save-repository-buffers nil
 )

;; powerline config
(setq powerline-default-separator 'alternate)

;; clean buffers everynight
(midnight-mode t nil (midight))
(sh-indentation 2)

(defun copy-word ()
  (interactive)
  (kill-new (thing-at-point 'word)))

(global-set-key (kbd "M-W") 'copy-word)

;; open splits vertically first
(setq split-height-threshold 80)
(setq split-width-threshold 160)

;; save hooks
(add-hook 'before-save-hook (lambda ()
                              (auto-make-directory)
                              (whitespace-cleanup)))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(flycheck-sass-executable "/Users/andy/.rvm/gems/ruby-2.1.5@poc-oliver/bin/sass")
 '(flycheck-scss-executable "/Users/andy/.rvm/gems/ruby-2.1.5@poc-oliver/bin/sass")
 '(flycheck-standard-error-navigation nil)
 '(global-auto-complete-mode t)
 '(js2-basic-offset 2)
 '(js2-highlight-level 3)
 '(js2-include-node-externs t)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-cond-assign-warning nil)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(js2-strict-var-hides-function-arg-warning nil)
 '(js2-strict-var-redeclaration-warning nil)
 '(magit-save-repository-buffers nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-indent-style 1)
 '(web-mode-markup-indent-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
