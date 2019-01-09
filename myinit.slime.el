;;; myinit.slime.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

;; slime
(use-package slime
  :ensure t
  :ensure ac-slime
  :init
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (add-to-list 'slime-contribs 'slime-fancy))

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

(provide 'myinit.slime)

;;; myinit.slime.el ends here
