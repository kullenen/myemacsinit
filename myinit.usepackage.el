;;; myinit.usepackage.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(provide 'myinit.usepackage)

;;; myinit.usepackage.el ends here
