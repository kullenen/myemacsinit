;;; myinit.common.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

(defun myinit-set-font ()
  "Set font default parameters."
  (interactive)
  ;; (set-default-font "Monaco")
  (set-frame-font "Monaco" nil t)
  (set-face-attribute 'default (selected-frame) :height 100))


; ibuffer
(global-set-key (kbd "S-<f5>") 'ibuffer)
(global-set-key (kbd "<f17>") 'ibuffer)


(myinit-set-font)

(setq column-number-mode t)

;; save minibufer historty between sessions
(savehist-mode t)

;; autosave desktop session
(desktop-save-mode 1)

;; no bars !!!
(menu-bar-mode -1)
(tool-bar-mode -1)
;(scroll-bar-mode -1)

;; w3m for php manual
(use-package w3m
  :ensure t
  :init
  (setq browse-url-browser-function 'w3m-browse-url))

;; auto complete
(use-package auto-complete
  :ensure t
  :config
  (global-auto-complete-mode))

;; highlight brackets
(show-paren-mode t)

(provide 'myinit.common)

;;; myinit.common.el ends here
