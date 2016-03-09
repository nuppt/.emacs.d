;;; highlight-100+.el --- highlight characters beyond column 100
;;
;; Copyright (C) 2008 Nikolaj Schumacher
;;
;; Author: Nikolaj Schumacher <bugs * nschum de>
;; Version: 1.0
;; Keywords: faces
;; URL: http://nschum.de/src/emacs/highlight-tabs/
;; Compatibility: GNU Emacs 22.x
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; This mode highlights all characters that cross the 100 character line limit.
;;
;;; Change Log:
;;
;; 2008-08-11 (1.0)
;;    Initial release.
;;
;;; Code:

(defgroup highlight-100+ nil
  "Highlight characters beyond column 100."
  :group 'faces)

(defcustom highlight-100+-columns 100
  "*Number of columns to allow in lines."
  :group 'highlight-100+
  :type 'integer)

(defface highlight-100+-line
  nil
  "*Face for showing lines with over `highlight-100+-columns'."
  :group 'highlight-100+-line)

(defface highlight-100+
  '((((background dark)) (:background "blue"))
    (((background light)) (:background "dark gray")))
  "*Face for showing characters beyond column `highlight-100+-columns'."
  :group 'highlight-100+-line)

(defface highlight-100+-first
  nil
  "*Face for showing the first character beyond `highlight-100+-columns'."
  :group 'highlight-100+-line)

(defconst highlight-100+-keywords
  `((highlight-100+-matcher (0 'highlight-100+-line prepend)
                           (1 'highlight-100+ prepend)
                           (2 'highlight-100+-first prepend))))

(defsubst highlight-100+-format ()
  (if (< tab-width 2)
      "^\\(\\)\\([^\n]\\)\\{100,\\}$"
    (concat (format "^\\(?:[^\t\n]\\{%d\\}\\|[^\t\n]\\{,%d\\}\t\\)\\{%d\\}"
                    tab-width (- tab-width 1)
                    (/ highlight-100+-columns tab-width))
            (let ((remainder (mod highlight-100+-columns tab-width)))
              (when remainder
                (format "\\(?:[^\t\n]\\{%d\\}\\|\t\\)" remainder)))
            "\\(\\(.\\).*\\)$")))

(defvar highlight-100+-last-width 0)
(make-variable-buffer-local 'highlight-100+-last-width)

(defvar highlight-100+-last-keywords "")
(make-variable-buffer-local 'highlight-100+-last-keywords)

(defun highlight-100+-matcher (limit)
  ;; Update search when `tab-width' has changed.
  (unless (equal highlight-100+-last-width tab-width)
    (setq highlight-100+-last-keywords (highlight-100+-format)
          highlight-100+-last-width tab-width)
    ;; The rest of the buffer can't be right, either.
    (let ((font-lock-keywords))
      (font-lock-fontify-buffer)))
  ;; re-search-forward is C and much faster checking columns ourselves
  (re-search-forward highlight-100+-last-keywords nil t))

;;;###autoload
(define-minor-mode highlight-100+-mode
  "Highlight the portions of lines longer than 100 characters."
  nil " 100+" nil
  (if highlight-100+-mode
      (font-lock-add-keywords nil highlight-100+-keywords t)
    (font-lock-remove-keywords nil highlight-100+-keywords)
    (kill-local-variable 'highlight-100+-last-keywords)
    (kill-local-variable 'highlight-100+-last-width))
  (font-lock-fontify-buffer))

(provide 'highlight-100+)
;;; highlight-100+.el ends here
