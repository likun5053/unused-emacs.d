;; auto-complete and yasnippet
(add-to-list 'load-path "~/.emacs.d/bundle/yasnippet/")
;;not yasnippet-bundle
(require 'yasnippet) 
;Don't map TAB to yasnippet
;In fact, set it to something we'll never use because
;we'll only ever trigger it indirectly.
(setq yas/snippets-dirs "~/.emacs.d/bundle/yasnippet/snippets")
(yas/load-directory yas/snippets-dirs)
(setq yas/prompt-functions '( yas/dropdown-prompt yas/x-prompt  yas/ido-prompt yas/completing-prompt)) 
(yas/initialize)
(setq yas/trigger-key "<backtab>")

(add-to-list 'load-path "~/.emacs.d/bundle/auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/bundle/auto-complete/dict")
(ac-config-default)
(global-auto-complete-mode t) 
;;(setq ac-auto-start 4)
(setq ac-ignore-case nil)
(setq ac-dwim  t)
(ac-set-trigger-key "TAB")

;;copy from ac 0.2.0 version
(defmacro ac-define-dictionary-source (name list)
  "Define dictionary source named `NAME'.
`LIST' is a list of string.
This is useful if you just want to define a dictionary/keywords source."
  `(defvar ,name
     '((candidates . (lambda () (all-completions ac-prefix ,list))))))

(load-file "~/.emacs.d/bundle/freq-word.el")
(require 'freq-word)
(ac-define-dictionary-source ac-freq-word freq-word-list)

;; The mode that automatically startup.
(setq ac-modes
      '(emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode
                        c-mode cc-mode c++-mode java-mode
                        perl-mode cperl-mode python-mode ruby-mode
                        ecmascript-mode javascript-mode php-mode css-mode
                        makefile-mode sh-mode fortran-mode f90-mode ada-mode
                        xml-mode sgml-mode
                        haskell-mode literate-haskell-mode
                        emms-tag-editor-mode
                        asm-mode
                        org-mode
                        jde-mode js2-mode nxhtml-mode html-mode css-mode scss-mode
                        ))

(add-to-list 'ac-trigger-commands 'org-self-insert-command)

(custom-set-variables
'(ac-sources
'(
    ;;ac-source-yasnippet
    ac-source-semantic    ;this source need file `auto-complete-semantic.el'
    ac-source-imenu
    ac-freq-word
    ac-source-abbrev
    ac-source-dictionary
    ac-source-words-in-buffer
    ac-source-files-in-current-dir
    ac-source-filename
    )))               

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Lisp mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-interaction-mode
               ))
  (add-hook hook '(lambda ()
                    (add-to-list 'ac-sources 'ac-source-symbols))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; C-common-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar ac-source-etags
  '((candidates
     . (lambda () (all-completions ac-target (tags-completion-table))))))
(defun add-ac-source-etags ()
  (require 'etags)
  (make-local-variable 'ac-sources)
  (add-to-list 'ac-sources 'ac-source-etags))
(add-hook 'c-mode-common-hook 'add-ac-source-etags)

