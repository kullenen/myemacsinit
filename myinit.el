;;; myinit.el --- My Initialization file for Emacs

;;; Commentary:
;; 

;;; Code:

(when (>= emacs-major-version 24)
  (require 'package)

  ;; (add-to-list
  ;;  'package-archives
  ;;  '("melpa-stable" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
  ;;  t)

  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)

  ;; (add-to-list
  ;;  'package-archives
  ;;  ;; '("melpa" . "http://melpa.milkbox.net/packages/")
  ;;  t)

  ;; (add-to-list
  ;;  'package-archives
  ;;  '("marmalade" . "https://marmalade-repo.org/packages/")
  ;;  t))
  )

(package-initialize)


(require 'myinit.usepackage)

(require 'myinit.common)

(require 'myinit.magit)

(require 'myinit.flycheck)

(require 'myinit.php)

(require 'myinit.json)

(require 'myinit.xml)

(require 'myinit.slime)


(toggle-frame-maximized)

(provide 'myinit)

;;; myinit.el ends here
