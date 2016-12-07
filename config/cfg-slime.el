;; slime setup

(require-package 'slime)
(if (eq system-type 'windows-nt)
    (setq inferior-lisp-program "D:/Program Files (x86)/Steel Bank Common Lisp/1.3.12/sbcl.exe")
  (setq inferior-lisp-program "/usr/local/bin/sbcl"))

(slime-setup '(slime-fancy slime-banner))

(provide 'cfg-slime)
