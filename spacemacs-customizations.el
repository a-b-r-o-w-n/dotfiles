;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(case-fold-search nil)
 '(compilation-message-face (quote default))
 '(create-lockfiles nil)
 '(custom-safe-themes
   (quote
    ("38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "086354c2a7f80838d080dc668cb92b95994006533b57cd90014697be084897df" "66c422bb192c60c7655b1c527e77d46aa712f0b501ab81887fadc654de95cee6" "78d2700ddf40a1f9990e03b2057d116cd307fde13fe3ba3788321ae393631927" "c489f4b08be68f497965026e4352a72be3366d9ad842740a467f15f897fd57db" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" default)))
 '(delete-selection-mode t)
 '(exec-path-from-shell-check-startup-files nil)
 '(fci-rule-color "#3E3D31" t)
 '(flycheck-emacs-lisp-load-path (quote inherit) t)
 '(flycheck-sass-executable "/Users/andy/.rvm/gems/ruby-2.1.5@poc-oliver/bin/sass")
 '(flycheck-scss-executable "/Users/andy/.rvm/gems/ruby-2.1.5@poc-oliver/bin/sass")
 '(flycheck-standard-error-navigation nil t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3E3D31" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#3E3D31" . 100))))
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
 '(magit-commit-arguments nil t)
 '(magit-diff-use-overlays nil)
 '(magit-save-repository-buffers nil t)
 '(midnight-mode t nil (midnight))
 '(ns-command-modifier (quote meta))
 '(paradox-github-token t)
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(projectile-create-missing-test-files nil)
 '(projectile-git-command
   "ag --nocolor --files-with-matches --hidden --ignore \".git/\" -g \"\"")
 '(projectile-global-mode t)
 '(projectile-switch-project-action (quote projectile-dired))
 '(sh-indentation 2)
 '(sp-highlight-pair-overlay nil)
 '(sp-show-pair-delay 0.2)
 '(sp-show-pair-from-inside t)
 '(tramp-default-method "ssh")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-pairing nil t)
 '(web-mode-indent-style 1)
 '(web-mode-markup-indent-offset 2)
 '(weechat-color-list
   (unspecified "#272822" "#3E3D31" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(yas-snippet-dirs
   (quote
    ("/Users/andy/dotfiles/emacs/snippets/" yas-installed-snippets-dir "/Users/andy/.emacs.d/layers/auto-completion/snippets")) nil (yasnippet)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(button ((t (:inherit link-visited))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(flycheck-error ((t (:underline "#e0211d"))))
 '(flycheck-fringe-error ((t (:foreground "#e0211d" :weight bold))))
 '(helm-source-header ((t (:background "#F92672" :foreground "white" :height 1.3))))
 '(linum ((t (:background "#212026" :foreground "#44505c" :family "Inconsolatag")))))
