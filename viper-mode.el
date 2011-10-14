;;git clone git://gitorious.org/vimpulse/vimpulse.git
;;cd vimpulse
;;make big
;;cp -r vimpulse ~/.emacs.d/bundle/
(add-to-list 'load-path "~/.emacs.d/bundle/vimpulse/bigd") 
(add-to-list 'load-path "~/.emacs.d/bundle/vimpulse-surround") 
(require 'vimpulse)
(require 'vimpulse-surround)

(eval-after-load 'viper
'(progn
    (setq viper-vi-state-id (concat (propertize "<V>" 'face 'hi-blue-b) " "))
    (setq viper-emacs-state-id (concat (propertize "<E>" 'face 'hi-red-b) " "))
    (setq viper-insert-state-id (concat (propertize "<I>" 'face 'hi-blue-b) " "))
    (setq viper-replace-state-id (concat (propertize "<R>" 'face 'hi-blue-b) " "))
    ;; The property `risky-local-variable' is a security measure
    ;; for mode line variables that have properties
    (put 'viper-mode-string 'risky-local-variable t)))

;; load viper-mode all the time
(add-hook 'fundamental-mode-hook '(lambda () (viper-mode t)))

;; define key map in Dired mode
(setq dired-mode-map (make-keymap))
(suppress-keymap dired-mode-map)
(define-key dired-mode-map "v" 'dired-x-find-file)
(define-key dired-mode-map "V" 'dired-view-file)
(define-key dired-mode-map "j" 'dired-next-line)
(define-key dired-mode-map "J" 'dired-goto-file)
(define-key dired-mode-map "k" 'dired-previous-line)
(define-key dired-mode-map "K" 'dired-do-kill-lines)


(setq viper-shift-width 4)
