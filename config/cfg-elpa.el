;;; I just use only package.el bundled in emacs
(require 'package)


;; Main package repositories

;;; Also use Melpa for most packages
(if (< emacs-major-version 24)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'package-archives
             '("popkit" . "http://elpa.popkit.org/packages/"))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install package `%s': %S" package err)
     nil)))

;;; Fire up package.el

(setq package-enable-at-startup nil)
(package-initialize) ;; You might already have this line, it will load all packages under the dir ~/.emacs.d/elpa/

(require-package 'fullframe)
(fullframe list-packages quit-window)

(require-package 'cl-lib)
(require 'cl-lib)

;;(defun sanityinc/set-tabulated-list-column-width (col-name width)
;;  "Set any column with name COL-NAME to the given WIDTH."
;;  (cl-loop for column across tabulated-list-format
;;	   when (string= col-name (car column))
;;	   do (setf (elt column 1) width)))
;;
;;(defun sanityinc/maybe-widen-package-menu-columns ()
;;  "Widen some columns of the package menu table to avoid truncation."
;;  (when (boundp 'tabulated-list-format)
;;    (sanityinc/set-tabulated-list-column-width "Version" 13)
;;    (let ((longest-archive-name (apply 'max (mapcar 'length (mapcar 'car package-archives)))))
;;      (sanityinc/set-tabulated-list-column-width "Archive" longest-archive-name))))
;;
;;(add-hook 'package-menu-mode-hook 'sanityinc/maybe-widen-package-menu-columns)


(provide 'cfg-elpa)
