;; disable auto-save files (#foo#)
(setq auto-save-default nil)

;; disable backup files (foo~)
(setq backup-inhibited t)

;; disable auto-save-list/.saves
(setq auto-save-list-file-prefix nil)

;; disable bell
(setq visible-bell nil)

;; always open in the same window
(setq ns-pop-up-frames nil)

;; show extra whitespace
(setq show-trailing-whitespace t)

;; hide empty line fringe
(set-default 'indicate-empty-lines nil)

;; set line number in line-mode and left column
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)

;; start with max window
(custom-set-variables
  '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; hide menu-bar tool-bar scroll-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; delete tail-whitespace before saving
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;; 更新当前buffer与对应的disk上内容一致
(global-set-key (kbd "C-=") 'revert-buffer)



(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(if (eq system-type  'windows-nt)
    (prefer-coding-system 'gb2312))

(if (eq system-type 'windows-nt)
    (setq buffer-file-coding-system 'gb2312))


;; Set exec-path for Windows, OSX and Linux
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string (concat "echo -n "
							  (if (string-equal system-type "windows-nt")
							      "%PATH%'"
							    "%PATH")))))
    (progn (setenv "PATH" path-from-shell)
	   (setq exec-path (split-string path-from-shell path-separator)))))


;; I cann't execute 'echo %PATH%' command in shell-mode of emacs on windows.
;; If anybody can fix it, please tell me.
(if (and (display-graphic-p)
	 (not (string-equal system-name "windows-nt")))
    (set-exec-path-from-shell-PATH))

(if (not (string-equal system-name "windows-nt"))
    (progn (setenv "PATH" (concat "/Library/TeX/texbin:/usr/local/bin:" (getenv "PATH")))
	   (setq exec-path (append '("/Library/TeX/texbin" "/usr/local/bin") exec-path))))



(provide 'cfg-global)
