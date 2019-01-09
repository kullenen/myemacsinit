;;; myinit.json.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

;; for json files
(add-hook 'js-mode-hook
	  '(lambda ()
	     (setq js-indent-level 4)
	     (setq indent-tabs-mode t)
	     (setq tab-width 4)))

(provide 'myinit.json)

;;; myinit.json.el ends here
