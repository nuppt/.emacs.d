;;; This is the binary name of my scheme implementation
(setq scheme-program-name "/Applications/mit-scheme.app/Contents/Resources/mit-scheme")
(if (string-equal system-type "windows-nt")
    (progn (setenv "MITSCHEME_LIBRARY_PATH" "D:/Program Files (x86)/MIT-GNU Scheme/lib")
           (setq scheme-program-name "mit-scheme.exe")))

;;; Always do syntax highlighting
(global-font-lock-mode 1)

(provide 'cfg-scheme-mode)
;;; xscheme.el ends here
