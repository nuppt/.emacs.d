;;; z3-smt2-mode.el --- Support for the SMT2 format -*- lexical-binding: t -*-

(require 'cl-lib)

(defconst z3-smt2-builtins '("assert"
							 "check-sat"
							 "declare-const"
							 "declare-fun"
							 "declare-sort"
							 "define-fun"
							 "define-sort"
							 "declare-datatypes"
							 "exit"
							 "echo"
                             "get-assertions"
							 "get-assignment"
							 "get-info"
							 "get-option"
							 "get-proof"
							 "get-model"
							 "get-unsat-core"
                             "get-value"
							 "pop"
							 "push"
							 "set-info"
							 "set-logic"
							 "set-option"
							 "and"
							 "or"
							 "not"))

(defconst z3-smt2-types '("Array"
						  "Set"
						  "List"
						  "Bool"
						  "Int"
						  "Real"))

(defconst z3-smt2-all-keywords (cl-loop for source in '(z3-smt2-builtins z3-smt2-types)
                                        append (mapcar (lambda (kwd) (propertize kwd 'source source)) (symbol-value source))))

(defcustom z3-smt2-prover-args '()
  "Arguments to pass to Z3 when checking a file.
The name of the file itself is added last.  You can override all
arguments here, or use `z3-smt2-prover-custom-args' to add just a
few extra flags in addition to the default ones."
  :group 'z3)

(defcustom z3-smt2-prover-custom-args '()
  "Extra arguments to pass to Z3 when checking a file.
These come in addition to `z3-smt2-prover-args'."
  :group 'z3)

(defcustom z3-smt2-prover-background-args '()
  "Extra arguments to pass to Z3 for background verification.
These come in addition to `z3-smt2-prover-args' and
`z3-smt2-prover-custom-args'."
  :group 'z3)

(defcustom z3-smt2-prover-local-args '()
  "Extra arguments to pass to Z3 when checking a file.
These come in addition to `z3-smt2-prover-args' and
`z3-smt2-prover-custom-args'."
  :group 'z3)

(defcustom z3-smt2-prover-alternate-args '()
  "Extra arguments to pass to Z3 when compiling with a prefix arg.
Added to `z3-smt2-prover-basic-args' and `z3-smt2-prover-custom-args'
when launching manual verification (\\[z3-smt2-friends-verify])
with a prefix arg."
  :group 'z3)

(defvar z3-smt2-font-lock-keywords
  (list
   (cons "!" font-lock-negation-char-face)
   (cons (regexp-opt z3-smt2-types 'symbols) font-lock-type-face)
   (cons (regexp-opt z3-smt2-builtins 'symbols) font-lock-builtin-face))
  "Font lock specifications for `z3-smt2-mode'.")

(defvar z3-smt2-mode-syntax-table
  lisp-mode-syntax-table
  "Syntax table used in `z3-smt2-mode'.")

(defun z3-smt2-syntactic-face-function (state)
  (let ((lisp-font (lisp-font-lock-syntactic-face-function state)))
    (or lisp-font (and (nth 3 state)
                       (eq (char-after (nth 8 state)) ?|)
                       font-lock-string-face))))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.smt2\\'" . z3-smt2-mode))

(defconst z3-smt2-error-patterns
  '((error bol "(error \"line " line " column " column ":" (message) "\")" eol)
    (warning bol "WARNING: " (message)  eol)))

;;;###autoload
(define-derived-mode z3-smt2-mode prog-mode "Z3-SMT2"
  "Major mode for editing SMT2 programs."
  :group 'lisp
  :syntax-table z3-smt2-mode-syntax-table

  (lisp-mode-variables nil nil)
  (setq font-lock-defaults
        (cl-subst 'z3-smt2-syntactic-face-function
                  'lisp-font-lock-syntactic-face-function font-lock-defaults))
  (font-lock-add-keywords nil z3-smt2-font-lock-keywords))

(provide 'cfg-z3-smtlib2-mode)
;;; z3-smt2-mode.el ends here
