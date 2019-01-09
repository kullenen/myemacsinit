;;; myinit.php.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

(use-package php-mode
  :ensure t
  :ensure company-php
  :ensure php-eldoc
  :ensure ggtags
  :requires (company-php php-eldoc ggtags))
  


(add-hook 'php-mode-hook
	  '(lambda ()

	     (company-mode t)
	     (ac-php-core-eldoc-setup) ;; enable eldoc
	     (make-local-variable 'company-backends)
	     (add-to-list 'company-backends 'company-ac-php-backend)
	     (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
	     (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back

	     (ggtags-mode 1)
	     ;;  (flymake-mode 1)
	     (php-eldoc-enable)
	     (setq indent-tabs-mode t)
	     (c-set-offset 'case-label '+)
	     (let ((my-tab-width 4))
	       (setq tab-width my-tab-width
		     c-basic-indent my-tab-width
		     c-basic-offset my-tab-width
		     php-mode-force-pear t)
	       (set (make-local-variable 'tab-stop-list)
		    (number-sequence my-tab-width 200 my-tab-width)))))

  

(provide 'myinit.php)

;;; myinit.php.el ends here
