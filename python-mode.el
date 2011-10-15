;;; bind RET to py-newline-and-indent
(defvar ac-source-python ‘((candidates .
		(lambda ()
		  (mapcar '(lambda (completion)
			     (first (last (split-string completion "\\." t))))
			  (python-symbol-completions (python-partial-symbol)))))))
(add-hook ‘python-mode-hook
	  )

(add-hook 'python-mode-hook '(lambda () 
     (define-key python-mode-map "\C-m" 'newline-and-indent)
     (lambda() (setq ac-sources '(ac-source-python))))

