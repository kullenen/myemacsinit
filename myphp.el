(defun myphp-insert-class-in-buffer-for-edit (buffer class &optional ancestor)
  (insert (format "<?php\n\nclass %s %s{\n" class (if ancestor (concat "extends " ancestor " ") "")))
  (save-excursion (insert "\n}\n")))

;; functions for php unit testing
(defun myphp-get-current-class-name ()
  (and (string= "class" (current-word)) (forward-word) (forward-word))
  (save-excursion
    (let ((regexp "^ *\\(\\(abstract\\|final\\) +\\)\\{0,1\\}class +"))
      (if (search-backward-regexp regexp nil t)
	  (progn
	    (search-forward-regexp regexp)
	    (current-word))))))

(defun myphp-find-test-path (path)
  (let ((path1 (file-name-directory path)) (path2 (file-name-nondirectory path)) (test-path nil))
    (while (and path1 (not test-path))
      (let ((checked-test-path (concat (file-name-as-directory path1) "tests")))
	(if (file-exists-p checked-test-path)
	    (setq test-path (concat (file-name-as-directory checked-test-path) path2))
	  (let ((path1-tail (file-name-nondirectory (directory-file-name path1))))
	    (setq path1 (if (= (length path1-tail) 0) nil (file-name-directory (directory-file-name path1))))
	    (setq path2 (concat (file-name-as-directory path1-tail) path2))))))
    test-path))

(defun myphp-get-test-file-name (class)
  (let ((path (myphp-find-test-path (file-name-directory (buffer-file-name (current-buffer))))))
    (if path (format "%s%sTest.php" (file-name-as-directory path) class))))

(defun myphp-class-to-test ()
  "Create phpunit test for current class"
  (interactive)
  (remove-hook 'php-mode-hook 'myphp-insert-class-in-new-current-buffer)
  (let* ((class (myphp-get-current-class-name))
	 (file-name (if class (myphp-get-test-file-name class) nil))
	 (buffer (if file-name (find-file file-name))))
    (if (and buffer (= (buffer-size buffer) 0) (not (buffer-modified-p buffer)))
	(progn
	  (myphp-insert-class-in-buffer-for-edit buffer (concat class "Test") "PHPUnit_Framework_TestCase")
	  (message "Test for class %s has created" class))))
  (add-hook 'php-mode-hook 'myphp-insert-class-in-new-current-buffer))



;; on create new php file
(defun myphp-insert-class-in-new-current-buffer ()
  (and
   (not (file-exists-p (buffer-file-name (current-buffer))))
   (= (buffer-size (current-buffer)) 0)
   (myphp-insert-class-in-buffer-for-edit (current-buffer) (file-name-base (buffer-file-name (current-buffer))) nil)))

(add-hook 'php-mode-hook 'myphp-insert-class-in-new-current-buffer)
