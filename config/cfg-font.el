;; Setting English Font
;;(set-face-attribute 'default nil :font "Monoca 14")
(set-face-attribute 'default nil :font "Courier New 12")

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    ;;(font-spec :family "PingFang SC" :size 14)))
		    (font-spec :family "Microsoft Yahei" :size 14)))

(provide 'cfg-font)
