;; Global enrionment variables
(setq default-directory "~/")
(setq recentf-save-file "~/.emacs.d/recentf")

(defvar base-path user-emacs-directory)
(defvar config-path (concat base-path "/config/"))
(defvar packages-path (concat base-path "/packages/"))

(add-to-list 'load-path config-path)	 ;; Can not add within recursion into its subdir
;; Calls (package-initialize)
(require 'cfg-elpa)
;;(require 'cfg-custom)
(require 'cfg-global)
(require 'cfg-theme)
(require 'cfg-unicad)
(require 'cfg-powerline)
(require 'cfg-font)
(require 'cfg-neotree)
(require 'cfg-eshell)
(require 'cfg-windows-manage)
(require 'cfg-buffer-manage)
(require 'cfg-ido)
(require 'cfg-helm)

;; config for programming
(require 'cfg-general-programming)
(require 'cfg-slime)
(require 'cfg-org-mode)
(require 'cfg-c-cpp-ide-mode)
(require 'cfg-markdown-mode)
;;(require 'cfg-boogie-friends-mode)
(require 'cfg-z3-smtlib2-mode)
(require 'cfg-coq-mode)
(require 'cfg-scheme-mode)
(require 'cfg-lua-mode)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coq-prog-name "/usr/local/bin/coqtop")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (autopair fullframe yasnippet slime scheme-complete projectile idle-highlight-mode flycheck flx-ido f deferred color-theme auto-complete-clang auto-complete-c-headers auctex)))
 '(proof-three-window-enable t)
 '(solarized-termcolors 256))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
