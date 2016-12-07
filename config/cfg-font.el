(defun config-of-font-in-gui ()
  ;; config of english font
  ;;(set-face-attribute 'default nil :font "Monoca 14")
  ;;(set-face-attribute 'default nil :font "Courier New 14")
  (set-face-attribute 'default nil :font "Consolas 14")

  ;; config of chinese font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      ;;(font-spec :family "PingFang SC" :size 14)))
                      (font-spec :family "Microsoft Yahei" :size 14))))

(defun config-of-font-in-terminal ()
    ;; config of english font
  ;;(set-face-attribute 'default nil :font "Monoca 14")
  ;;(set-face-attribute 'default nil :font "Courier New 14")
  (set-face-attribute 'default nil :font "Consolas 14"))

(if (display-graphic-p)
    (config-of-font-in-gui)
  (config-of-font-in-terminal))

(provide 'cfg-font)
