;;
;; This file collects some common config for those
;; programming languages.

;; highlight the proper parenthesis
;; just match for (), not others like [] or {}.
(show-paren-mode t)

;; This is a plug-in named autopair.
;; match and complete the proper pair parenthesis automatically.
(require-package 'autopair)
(autopair-global-mode)

;; display bound line at right side
(add-to-list 'load-path (concat packages-path "highlight-100+/"))
(require 'highlight-100+)
(highlight-100+-mode 1)

;; enable auto-highlight in current symbol for following PL(s).
(require-package 'idle-highlight-mode)
(add-hook 'c-mode-hook 'idle-highlight-mode)
(add-hook 'c++-mode-hook 'idle-highlight-mode)
(add-hook 'python-mode-hook 'idle-highlight-mode)
(add-hook 'emacs-lisp-mode-hook 'idle-highlight-mode)
(add-hook 'js-mode-hook 'idle-highlight-mode)
(add-hook 'scheme-mode-hook 'idle-highlight-mode)
(add-hook 'z3-smt2-mode-hook 'idle-highlight-mode)


;; enable HideShow mode for following PL(s).
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'hs-minor-mode)
(add-hook 'scheme-mode-hook 'hs-minor-mode)
(add-hook 'z3-smt2-mode-hook 'hs-minor-mode)
(global-set-key [f1] 'hs-toggle-hiding)


(provide 'cfg-general-programming)
