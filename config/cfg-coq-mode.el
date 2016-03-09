(add-to-list 'load-path (concat packages-path "ProofGeneral/generic/"))
(load-file (concat packages-path "ProofGeneral/generic/proof-site.el"))

;; set coq exec-path
(custom-set-variables '(coq-prog-name "/usr/local/bin/coqtop") '(proof-three-window-enable t))

(provide 'cfg-coq-mode)
