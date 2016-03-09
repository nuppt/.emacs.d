(defun ignore-error-wrapper (fn)
  "Funtion return new function that ignore errors.
   The function wraps a function with `ignore-errors' macro."
  (lexical-let ((fn fn))
    (lambda ()
      (interactive)
      (ignore-errors
	(funcall fn)))))

(global-set-key [C-left] (ignore-error-wrapper 'windmove-left))
(global-set-key [C-right] (ignore-error-wrapper 'windmove-right))
(global-set-key [C-up] (ignore-error-wrapper 'windmove-up))
(global-set-key [C-down] (ignore-error-wrapper 'windmove-down))

(add-to-list 'load-path (concat packages-path "transpose-frame/"))
(require 'transpose-frame)
(global-set-key "\C-c\C-t" 'transpose-frame)


(provide 'cfg-windows-manage)
