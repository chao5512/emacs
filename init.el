(require 'package)
(setq package-enable-at-startup nil)
;;(require 'cask "~/.cask/cask.el")
;;(cask-initialize)
(add-to-list 'package-archives 
	     '("melpa" . "http://elpa.emacs-china.org/melpa/"))
(add-to-list 'package-archives 
'("MELPA-Stable" . "http://elpa.emacs-china.org/melpa-stable/"))
 (add-to-list 'package-archives '("vmelpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))



(org-babel-load-file (expand-file-name "~/.emacs.d/el/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-delay 0.2)
 '(blink-cursor-interval 0.2)
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("73c69e346ec1cb3d1508c2447f6518a6e582851792a8c0e57a22d6b9948071b4" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(org-agenda-files (quote ("~/org/i.org" "~/org/inbox.org")))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/org")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-archives
   (quote
    (("MELPA-Stable" . "http://elpa.emacs-china.org/melpa-stable/")
     ("melpa" . "http://elpa.emacs-china.org/melpa/")
     ("org" . "http://elpa.emacs-china.org/org/"))))
 '(package-selected-packages
   (quote
    (org-pomodoro smartparens noflet undo-tree hungry-delete flycheck ox-reveal org org-bullets htmlize alect-themes poet-theme company-box company youdao-dictionary ace-window which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
