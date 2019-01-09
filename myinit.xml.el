;;; myinit.xml.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

(add-hook 'nxml-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode t)
	     (setq nxml-child-indent 4)
	     (setq tab-width 4)))

(provide 'myinit.xml)

;;; myinit.xml.el ends here
