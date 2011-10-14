;;mkdir ~/.emacs.d/bundle
(add-to-list 'load-path "~/.emacs.d")
;Add all top-level subdirectories of .emacs.d to the load path
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))
;I like to keep third party libraries seperate in ~/.emacs.d/vendor
(add-to-list 'load-path "~/.emacs.d/bundle")
(progn (cd "~/.emacs.d/bundle")
       (normal-top-level-add-subdirs-to-load-path))


(global-set-key "\C-z" 'ignore)
(global-set-key "\C-x\C-z" 'ignore)

(global-set-key [S-left] 'windmove-left)          ; move to left window
(global-set-key [S-right] 'windmove-right)        ; move to right window
(global-set-key [S-up] 'windmove-up)              ; move to upper window
(global-set-key [S-down] 'windmove-down)          ; move to lower window
(global-set-key (kbd "C-, a") 'anything)          
(global-set-key (kbd "C-, f") 'find-file-in-project)
;;C-c s
(global-set-key (kbd "C-c s") 'shell-mode)          ; move to lower window

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;(load-file "~/.emacs.d/bundle/smart-tab/smart-tab.el")
;;(require 'smart-tab)
;;(global-smart-tab-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basic settings
 (defvar user-temporary-file-directory
     (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)

(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))

(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; save and restore frames and windows session
(load-file "~/.emacs.d/bundle/revive.el")
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
;;Keyboard shortcuts
(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)

(load-file "~/.emacs.d/bundle/windows.el")
(require 'windows)
(win:startup-with-window)
(define-key ctl-x-map "C" 'see-you-again)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-library "visual")
(load-library "viper-mode")
(load-library "ido-mode")
(load-library "shell-mode")
(load-library "auto-complete")

;;autopair 
(add-to-list 'load-path "~/.emacs.d/bundle/autopair")
(require 'autopair)

(defvar autopair-modes '(lisp-interaction-mode lisp-mode emacs-lisp-mode org-mode nxhtml-mode js2-mode scss-mode css-mode python-mode java-mode shell-mode))
(defun turn-on-autopair-mode () (autopair-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

