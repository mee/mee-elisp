(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(haskell-program-name "ghci")
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode nil nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(ispell-program-name "aspell")
 '(make-backup-files nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(pop-up-windows nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-bell t)
 '(word-wrap t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-array-face ((t (:inherit font-lock-variable-name-face))))
 '(cperl-hash-face ((t (:inherit font-lock-variable-name-face)))))

;; misc options
(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-page 'disabled nil)
;; (setq redisplay-dont-pause t)

;; my personal stuff
(add-to-list 'load-path "~/.emacs.d")
(require 'git-export)

(fset 'fix-window
   "\C-x52\C-x5o\C-x50")
