;;; init.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

; ibuffer
(global-set-key (kbd "S-<f5>") 'ibuffer)

;(set-default-font "Monaco")
(set-frame-font "Monaco" nil t)
(set-face-attribute 'default (selected-frame) :height 100)
(setq column-number-mode t)


(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)
  (add-to-list
   'package-archives
   '("marmalade" . "https://marmalade-repo.org/packages/")
   t))

(package-initialize)

;; save minibufer historty between sessions
(savehist-mode t)

;; autosave desktop session
(desktop-save-mode 1)

;(require 'cl)
(require 'php-mode)
(require 'auto-complete)

(add-hook 'php-mode-hook
	  '(lambda ()

	     (require 'company-php)
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


(require 'magit)
;; magit hook for describe --tags --long
(defun magit-insert-mobi-jira-tag-line ()
  (insert (concat "Tag-long: " (magit-git-string "describe" "--tags" "--long") "\n")))

(magit-add-section-hook 'magit-status-sections-hook 'magit-insert-mobi-jira-tag-line)
;;

;; no bars !!!
(menu-bar-mode -1)
(tool-bar-mode -1)
;(scroll-bar-mode -1)

(use-package flycheck
	     :ensure t
	     :init (global-flycheck-mode))


(add-hook 'nxml-mode-hook
		  '(lambda ()
			 (setq indent-tabs-mode t)
			 (setq nxml-child-indent 4)
			 (setq tab-width 4)))



;;myutils
;(load-file "~/.emacs.d/myutils/myphp.el")
;;

;; w3m for php manual
(setq browse-url-browser-function 'w3m-browse-url)

;; for json files
(add-hook 'js-mode-hook
	  (lambda ()
	    (setq js-indent-level 4)
	    (setq indent-tabs-mode t)
	    (setq tab-width 4)))

;; slime
(add-hook 'lisp-mode-hook
	  (lambda ()
	    (slime-mode t)
	    (auto-complete-mode t)))

(add-hook 'inferior-lisp-mode-hook
	  (lambda ()
	    (inferior-slime-mode t)
	    (auto-complete-mode t)))

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook
	  (lambda ()
	    (auto-complete-mode t)
	    (set-up-slime-ac)))

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(toggle-frame-maximized)

(provide 'init)

;;; init.el ends here
