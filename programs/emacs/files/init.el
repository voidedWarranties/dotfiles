(require 'package)
(package-initialize)

(require 'ob-tangle)
(load-file (car (org-babel-tangle-file "~/.emacs.d/config.org" "~/.emacs.d/config.el")))
