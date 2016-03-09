;; Returns the short propmpt string for eshell
(defun eshell-prompt-function-short ()
  "Makes a short eshell prompt to avoid moving out of the buffer
    window boundary"
  (let* ((pwd (eshell/pwd))
         (pwdlst (split-string pwd "/"))
         (rpwdlst (reverse pwdlst))
         (base (car rpwdlst)))
    (concat (if (string= base "")
                "/"
              (if (cdr pwdlst) ">...< /" ""))
            base
            (if (= (user-uid) 0) " # " " $ "))))

;; Returns the long prompt string for eshell
(defun eshell-prompt-function-long ()
  "Makes a long standard eshell prompt"
  (concat (format-time-string "%l:%M %p") "| "
          (getenv "USER") "@" (getenv "HOSTNAME") ":"
          (eshell/pwd) (if (= (user-uid) 0) " # " " $ ")))

(setq eshell-prompt-function
      'eshell-prompt-function-short)

(defun eshell/sprompt ()
  "Makes a short eshell prompt to avoid moving out of the buffer
      window boundary (link to eshell-prompt-function-short)"
  (setq eshell-prompt-function
        'eshell-prompt-function-short))

(defun eshell/lprompt ()
  "Makes a long standard eshell prompt (link to
      eshell-prompt-function-long)"
  (setq eshell-prompt-function
        'eshell-prompt-function-long))

(provide 'cfg-eshell)
