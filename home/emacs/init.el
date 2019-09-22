(package-initialize)
;; Always follow symlinks
(setq vc-follow-symlinks t)

(require 'org)
(org-babel-load-file (concat user-emacs-directory "config.org"))
