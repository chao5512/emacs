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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-delay 0.2)
 '(blink-cursor-interval 0.2)
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("09feeb867d1ca5c1a33050d857ad6a5d62ad888f4b9136ec42002d6cdf310235" "a513bb141af8ece2400daf32251d7afa7813b3a463072020bb14c82fd3a5fe30" "be5b03913a1aaa3709d731e1fcfd4f162db6ca512df9196c8d4693538fa50b86" "9bd5ee2b24759fbc97f86c2783d1bf8f883eb1c0dd2cf7bda2b539cd28abf6a9" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "3e83abe75cebf5621e34ce1cbe6e12e4d80766bed0755033febed5794d0c69bf" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "ab98c7f7a58add58293ac67bec05ae163b5d3f35cddf18753b2b073c3fcd8841" "72c530c9c8f3561b5ab3bf5cda948cd917de23f48d9825b7a781fe1c0d737f2f" "fb09acc5f09e521581487697c75b71414830b1b0a2405c16a9ece41b2ae64222" "a02c000c95c43a57fe1ed57b172b314465bd11085faf6152d151385065e0e4b1" "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41" "daeaa8249f0c275de9e32ed822e82ff40457dabe07347fe06afc67d962a3b1e9" "4e7e04c4b161dd04dc671fb5288e3cc772d9086345cb03b7f5ed8538905e8e27" "d8a7a7d2cffbc55ec5efbeb5d14a5477f588ee18c5cddd7560918f9674032727" "910527ccae484eb78b7a3efe6864a3cf014c8ae2ad9bb35386911b757f8da1f6" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "8e7044bfad5a2e70dfc4671337a4f772ee1b41c5677b8318f17f046faa42b16b" "b48599e24e6db1ea612061252e71abc2c05c05ac4b6ad532ad99ee085c7961a7" "68b847fac07094724e552eeaf96fa4c7e20824ed5f3f225cad871b8609d50ace" "6a674ffa24341f2f129793923d0b5f26d59a8891edd7d9330a258b58e767778a" "9a3c51c59edfefd53e5de64c9da248c24b628d4e78cc808611abd15b3e58858f" "73c69e346ec1cb3d1508c2447f6518a6e582851792a8c0e57a22d6b9948071b4" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(line-spacing 0.2)
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
    (org-pomodoro smartparens noflet undo-tree hungry-delete flycheck ox-reveal org org-bullets htmlize alect-themes poet-theme company-box company youdao-dictionary ace-window which-key try use-package)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(show-paren-mode t)
 '(smartparens-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
