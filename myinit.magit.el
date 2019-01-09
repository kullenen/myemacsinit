;;; myinit.magit.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

(use-package magit
  :ensure t
  :init
  (magit-add-section-hook
   'magit-status-sections-hook
   '(lambda ()
      (insert (concat "Tag-long: " (magit-git-string "describe" "--tags" "--long") "\n")))))

(provide 'myinit.magit)

;;; myinit.magit.el ends here
