(add-to-list 'custom-theme-load-path (concat packages-path "emacs-color-theme-solarized/"))

(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'dark)    ;;选择solarized dark
(enable-theme 'solarized)


;; Globally map C-c t to a light/dark theme switcher
;; Also pull-in graphene for better fonts
(custom-set-variables '(solarized-termcolors 256))
(setq solarized-default-background-mode 'dark)

(defun set-background-mode (frame mode)
  (set-frame-parameter frame 'background-mode mode)
  ;;  (when (not (display-graphic-p frame))
  ;;    (set-terminal-parameter (frame-terminal frame) 'background-mode mode))
  (set-terminal-parameter (frame-terminal frame) 'background-mode mode)
  (enable-theme 'solarized))

(defun switch-theme ()
  (interactive)
  (let ((mode (if (eq (frame-parameter nil 'background-mode) 'dark)
		  'light 'dark)))
    (set-background-mode nil mode)))

(global-set-key (kbd "C-c t") 'switch-theme)

(add-hook 'after-make-frame-functions
	  (lambda (frame)
	    (let ((mode 'dark))
	      (set-frame-parameter frame 'background-mode mode)
	      (set-terminal-parameter frame 'background-mode mode))
	    (enable-theme 'solarized)))

(provide 'cfg-theme)
