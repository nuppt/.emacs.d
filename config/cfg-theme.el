(add-to-list 'custom-theme-load-path (concat packages-path "emacs-color-theme-solarized/"))
;;(require-package 'emacs-color-theme-solarized)

;; Globally map C-c t to a light/dark theme switcher
;; Also pull-in graphene for better fonts

(custom-set-variables '(solarized-termcolors 256))

(setq solarized-default-background-mode 'dark)
;;(setq solarized-default-background-mode 'light)

(load-theme 'solarized t)


(defun set-background-mode (frame mode)
  (set-frame-parameter frame 'background-mode mode)
  (when (not (display-graphic-p frame))
    (set-terminal-parameter (frame-terminal frame) 'background-mode mode))
  (enable-theme 'solarized))

(defun switch-theme ()
  (interactive)
  (let ((mode  (if (eq (frame-parameter nil 'background-mode) 'dark)
		   'light 'dark)))
    (set-background-mode nil mode)))

(add-hook 'after-make-frame-functions
	  (lambda (frame) (set-background-mode frame solarized-default-background-mode)))

(global-set-key (kbd "C-c t") 'switch-theme)


(provide 'cfg-theme)
