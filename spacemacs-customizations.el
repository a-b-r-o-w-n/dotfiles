;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(create-lockfiles nil)
 '(exec-path-from-shell-check-startup-files nil)
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(flycheck-sass-executable "/Users/andy/.rvm/gems/ruby-2.1.5@poc-oliver/bin/sass")
 '(flycheck-scss-executable "/Users/andy/.rvm/gems/ruby-2.1.5@poc-oliver/bin/sass")
 '(flycheck-standard-error-navigation nil)
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
 '(linum-format "%4d ")
 '(magit-branch-arguments nil)
 '(magit-save-repository-buffers nil)
 '(midnight-mode t nil (midnight))
 '(ns-command-modifier (quote meta))
 '(projectile-create-missing-test-files nil)
 '(projectile-git-command
   "ag --nocolor --files-with-matches --hidden --ignore \".git/\" -g \"\"")
 '(projectile-global-mode t)
 '(projectile-switch-project-action (quote projectile-dired))
 '(sh-indentation 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-pairing nil t)
 '(web-mode-indent-style 1)
 '(web-mode-markup-indent-offset 2)
 '(yas-snippet-dirs
   (quote
    ("/Users/andy/dotfiles/emacs/snippets/" yas-installed-snippets-dir "/Users/andy/.emacs.d/layers/auto-completion/snippets")) nil (yasnippet)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(flycheck-error ((t (:underline "#e0211d"))))
 '(flycheck-fringe-error ((t (:foreground "#e0211d" :weight bold))))
 '(linum ((t (:background "#212026" :foreground "#44505c" :family "Inconsolatag")))))
