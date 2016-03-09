;; cscope --- it's not just a plug-in in emacs, actually it's a independent tool to index source code.
;;(add-hook 'c-mode-common-hook
;;        '(lambda ()
;;           (require 'xcscope)))
;;(add-to-list 'load-path (concat packages-path "xcscope.el/"))
(require-package 'xcscope)
(cscope-setup)


;; 完整的补全方案：
;; Yasnippet + company + irony
;;
;; Yasnippet
(require-package 'yasnippet)
(yas-global-mode 1)

;; company
(add-to-list 'load-path (concat packages-path "company-mode/"))
;;(require-package 'company-mode)
(require 'company)
(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode); 全局开启
(setq company-show-numbers t); 显示序号
(setq company-idle-delay 0); 菜单延迟
(setq company-minimum-prefix-length 2); 开始补全字数

;; irony
(add-to-list 'load-path (concat packages-path "irony-mode/"))
(require 'irony)
(require 'irony-cdb)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; company-irony
(add-to-list 'load-path (concat packages-path "company-irony/"))
(require 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; replace the 'completion-at-point' and 'complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'irony-cdb-json)
(irony-cdb-json-add-compile-commands-path
 "~/Code_Set/Svn_of_Lab/latest/clang/"
 "~/Code_Set/Svn_of_Lab/latest/clang/build/compile_commands.json")

;; support irnoy-mode for c headers
(add-to-list 'load-path (concat packages-path "company-irony-c-headers/"))
(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

;; enable flycheck globally
(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; C language setting

(setq tab-width 4)
(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-set-style "K&R")
	     (setq indent-tabs-mode nil)
	     (setq c-basic-offset 4)))

;; C++ language setting
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (c-set-style "K&R")
	     (setq indent-tabs-mode nil)
	     (setq c-basic-offset 4)))

;; config of fill-column.el
;; following code solves a bug of conflict with fill-column.el and company.el (line: 82~102)
;;(add-to-list 'load-path (concat packages-path "fill-column-indicator.el/"))
(require-package 'fill-column-indicator)
(setq-default fci-rule-column 120)
;(setq fci-rule-width 1)
(setq fci-rule-color "grey80")
(setq-default fci-rule-character-color "green")
(add-hook 'after-change-major-mode-hook 'fci-mode)

(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
  (when (boundp 'fci-mode)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
(add-hook 'c-mode-hook 'fci-mode)
(add-hook 'c++-mode-hook 'fci-mode)


;; fill the starting part of new line when indent.
(add-to-list 'load-path (concat packages-path "filladapt.el/"))
(require 'filladapt)
(defun my-c-mode-common-hook ()
  (c-setup-filladapt)
  (filladapt-mode 1))
(add-hook 'c-mode-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c-mode-common-hook)


;; enable projectile
(require-package 'projectile)
(add-hook 'c-mode-hook 'projectile-mode)
(add-hook 'c++-mode-hook 'projectile-mode)
(setq projectile-indexing-method 'native)
;; (setq projectile-enable-caching t) ; if native mode is not enabled, we should add this statment to enable cache


;; set lldb for c/c++ debug
(add-to-list 'load-path (concat packages-path "gud.el/"))
(require 'gud)

;; identify .h file as header in c++, not in c
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(provide 'cfg-c-cpp-ide-mode)
