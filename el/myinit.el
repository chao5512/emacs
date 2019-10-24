(add-to-list 'package-archives '("org" . "http://elpa.emacs-china.org/org/") t)
;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(require 'cl)
(global-hl-line-mode 1)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-splash-screen t)
(global-linum-mode t)
(global-auto-revert-mode 1)
(scroll-bar-mode -1)
(setq cursor-type 'bar)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(delete-selection-mode 1)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(set-face-attribute 'default nil :height 160)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; (use-package monokai-theme
  ;;   :ensure t)



  ;; (use-package poet-theme
  ;; :ensure t
  ;; )

  ;; (use-package base16-theme
  ;; :ensure t
  ;; )
  ;; (load-theme 'monokai t)

  ;; (use-package spacemacs-theme
  ;;  :ensure t
  ;;  :load-path (".emacs/elpa/")
  ;;  :init
  ;;  )

;;(load-theme 'spacemacs-light t)

(use-package org 
  :ensure t
  :pin org)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 '(org-directory "~/org")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 )

(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-custom-commands
      '(("c" "别逛了！！进来闲着啊~"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "这些任务就给你看看，千万别做，就放着:")))
          (agenda "")
          (alltodo "")))))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-agenda-files (list "~/org/gcal.org"
                             "~/org/i.org"
                             "~/org/schedule.org"
                             "~/org/inbox.org"))

(setq org-capture-templates
      '(
        ("a" "Appointment" entry (file  "~/org/gcal.org" )
         "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
        ("l" "Link" entry (file+headline "~/org/links.org" "Links")
         "* %? %^L %^g \n%T" :prepend t)
        ("b" "Blog idea" entry (file+headline "~/org/i.org" "Blog Topics:")
         "* %?\n%T" :prepend t)
        ("t" "To Do Item" entry (file+headline "~/org/i.org" "To Do")
         "* TODO %?\n%u" :clock-in t :clock-resume t :prepend t)
        ("n" "Note" entry (file+headline "~/org/i.org" "Note space")
         "* %?\n%u" :prepend t)
        ("x" "inbox" entry (file "~/org/inbox.org")
         "* %?\n%T" :clock-in t :clock-resume t :prepend t)
        ))

(defadvice org-capture-finalize 
    (after delete-capture-frame activate)  
  "Advise capture-finalize to close the frame"  
  (if (equal "capture" (frame-parameter nil 'name))  
      (delete-frame)))

(defadvice org-capture-destroy 
    (after delete-capture-frame activate)  
  "Advise capture-destroy to close the frame"  
  (if (equal "capture" (frame-parameter nil 'name))  
      (delete-frame)))

(use-package noflet
  :ensure t )
(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
    (org-capture)))

                                        ; for inserting inactive dates
(define-key org-mode-map (kbd "C-c >") (lambda () (interactive (org-time-stamp-inactive))))

(use-package pomodoro
  :bind
  ("s-p" . org-pomodoro))

(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
        ))
(setq org-todo-keyword-faces
      '(("NEXT" .      (:background "red" :foreground "white" :weight bold))
        ("SOMEDAY" .   (:background "DarkOrange":foreground "MediumBlue" :weight bold)) 
        ("PENDING" .   (:background "LightGreen" :foreground "gray" :weight bold))
        ("TODO" .      (:background "DarkOrange" :foreground "black" :weight bold))
        ("DONE" .      (:background "azure" :foreground "Darkgreen" :weight bold)) 
        ("ABORT" .     (:background "gray" :foreground "black"))
        ))

;; 优先级范围和默认任务的优先级
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?E)
(setq org-default-priority ?E)
;; 优先级醒目外观
(setq org-priority-faces
      '((?A . (:background "red" :foreground "white" :weight bold))
        (?B . (:background "DarkOrange" :foreground "white" :weight bold))
        (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
        (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
        (?E . (:background "SkyBlue" :foreground "black" :weight bold))
        ))

;; 自动同步父级任务
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(use-package try
	:ensure t)

(use-package which-key
       :ensure t 
       :config
       (which-key-mode))

(use-package ace-window
:ensure t
:init
(progn
(setq aw-scope 'frame)
(setq aw-dispatch-always 't)
(global-set-key (kbd "C-x O") 'other-frame)
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
  ))

(use-package counsel
:ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))




  (use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))


  (use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
:ensure t
:bind ("C-r" . avy-goto-word-1)) ;; changed from char as per jcs

(use-package youdao-dictionary
  :commands
  (youdao-dictionary-search-at-point+))
  (global-set-key (kbd "C-q") 'youdao-dictionary-search-at-point+)

(use-package company
:ensure t
:config
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)

(global-company-mode t)
)


;company box mode
(use-package company-box
:ensure t
 :hook (company-mode . company-box-mode))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

; flashes the cursor's line when you scroll
(use-package beacon
:ensure t
:config
(beacon-mode 1)
; (setq beacon-color "#666600")
)

; deletes all the whitespace when you hit backspace or delete
(use-package hungry-delete
:ensure t
:config
(global-hungry-delete-mode))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package smartparens
  :config
  (smartparens-global-mode t))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
          (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs-select-window)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;;递归删除拷贝
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;;重用buffer
(put 'dired-find-alternate-file 'disabled nil)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(require 'dired-x)
;; 启动dired mode的时候启动org-download
;;(add-hook 'dired-mode-hook 'org-download-enable)

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(setq org-image-actual-width nil)
