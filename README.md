Execute commands:

cd ~/.emacs.d

git clone https://github.com/kullenen/myemacsinit.git




Add to .emacs the following lines:

(add-to-list 'load-path "~/.emacs.d/myemacsinit")

(require 'myinit)


