(add-to-list 'load-path "~/.emacs.d/source-packages/buffer-select.el")
(require 'bs)

(global-set-key "\C-x\C-b" 'bs-show)

(provide 'cfg-buffer-manage)
