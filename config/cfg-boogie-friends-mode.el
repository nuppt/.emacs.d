(require-package 'flycheck)

(add-to-list 'load-path (concat packages-path "boogie-friends/emacs/"))

(setq flycheck-dafny-executable "D:/Program Files (x86)/dafny/Dafny.exe")
;;(setq flycheck-boogie-executable "")
(setq flycheck-z3-smt2-executable "D:/Program Files (x86)/dafny/z3/bin/z3.exe")
;;(setq boogie-friends-profile-analyzer-executable "PATH-TO-Z3-AXIOM-PROFILER") ;; Optional

(require 'dafny-mode)
(require 'boogie-mode)

(provide 'cfg-boogie-friends-mode)
