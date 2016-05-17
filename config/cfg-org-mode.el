(add-to-list 'load-path (concat packages-path "org-mode/lisp/"))
(add-to-list 'load-path (concat packages-path "org-mode/contrib/lisp/"))

(defvar gtd-directory "~/Dropbox/个人计划文档")

;; 快速打开自己的GTD文件
(defun gtd ()
  (interactive)
  (find-file (concat gtd-directory "/Lab.org"))
  (find-file (concat gtd-directory "/interests.org"))
  (find-file (concat gtd-directory "/english.org")))


;; gtd.org加入到日程表文件中
(setq org-agenda-files (list (concat gtd-directory "/Lab.org")
			     (concat gtd-directory "/interests.org")
			     (concat gtd-directory "/english.org")))


;; global config of todolist keywords
(setq org-todo-keywords '((sequence "HANDLING(h)" "WAITING(w)" "TODO(t)" "|" "DONE(d)" "CANCEL(c)")))

(setq org-todo-keyword-faces '(("HANDLING" . "yellow")
			       ("WAITING" . "blue")
			       ("TODO" . "red")
			       ("DONE" . "green")
			       ("CANCEL" . "gray")))


;; 设置org-mode中的缩进，使得编写时，整个org file排版更加美观。
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-indent-mode t)) t)

;; 设置inline image的实时显示
(add-to-list 'load-path (concat packages-path "inline-image/"))
(require 'iimage)
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

;; 设置代码编辑功能 —— 语法高亮
(setq org-src-fontify-natively t)

;; 设置自动换行
;; keybinding for toggling soft word wrapping mode
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

;; 配置Org-mode中所支持的变成语言
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (C . t)
   (lisp . t)
   (scheme . t)
   (sh . t)))

;; 设置显示UTF-8字符
;;(setq org-pretty-entities t)

;; basic shortcut key
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;(require 'org-notify)
;;(org-notify-start)
;;(org-notify-add 'appt
;;		'(:time "-1s" :period "20s" :duration 10
;;			:actions (-message -ding))
;;		'(:time "15m" :period "2m" :duration 100
;;			:actions -notify)
;;		'(:time "2h" :period "5m" :actions -message)
;;		'(:time "3d" :actions -email))


;; setting of exporting from org into pdf
(setq org-latex-pdf-process
  '("xelatex -shell-escape -interaction nonstopmode %f"
    "xelatex -shell-escape -interaction nonstopmode %f"
    "xelatex -shell-escape -interaction nonstopmode %f"
    "xelatex -shell-escape -interaction nonstopmode %f"
    "rm -f %o/%b*.vrb")) ;; for multiple passes

;; Stop org from keep the tables centered
(setq org-latex-tables-centered nil)
(setq org-latex-listings 'minted)

(defvar en-article "
\\documentclass{scrartcl}
\\usepackage{hyperref}
\\usepackage{color}
\\usepackage[hyperref,x11names,usenames,dvipsnames]{xcolor}
\\hypersetup{colorlinks=true,linkcolor=BlueViolet}
\\usepackage{minted}
\\usepackage[top=1in,bottom=1in,left=0.8in,right=0.8in]{geometry}
\\usepackage[center,pagestyles]{titlesec}
\\usepackage{indentfirst}
\\usepackage[export]{adjustbox}
\\usemintedstyle{emacs}
\\setlength{\\parskip}{0.5\\baselineskip}
\\setlength{\\parindent}{0em}
\\titleformat{\\section}{\\Large\\bfseries}{\\S\\,\\thesection}{1em}{}
\\titleformat{\\subsection}{\\large\\bfseries}{\\S\\,\\thesubsection}{1em}{}
\\titleformat{\\subsubsection}{\\bfseries}{$\\cdot$~\\,\\thesubsubsection}{0.5em}{}
\\newpagestyle{main}{
\\sethead{\\small\\S\\,\\thesection\\quad\\sectiontitle}{}{$\\cdot$~\\thepage~$\\cdot$}
\\setfoot{}{}{}\\headrule}
\\pagestyle{main}
")

(defvar en-beamer "
\\documentclass\[presentation\]\{beamer\}
\\usepackage{minted}
\\usemintedstyle{emacs}
\\AtBeginSection[]{\\begin{frame}<beamer>\\frametitle{Topic}\\tableofcontents[currentsection]\\end{frame}}
")

(defvar zh-preamble "
\\usepackage{xeCJK}
\\setCJKmainfont[BoldFont=Adobe Heiti Std, ItalicFont=Adobe Kaiti Std]{Adobe Song Std}
\\setCJKmonofont[Scale=0.9]{Adobe Song Std}
\\setCJKfamilyfont{song}[BoldFont=Adobe Heiti Std]{Adobe Song Std}
\\setCJKfamilyfont{sf}[BoldFont=Adobe Heiti Std]{Adobe Song Std}
\\renewcommand{\\contentsname}{目录}
\\renewcommand{\\listfigurename}{插图目录}
\\renewcommand{\\listtablename}{表格目录}
\\renewcommand{\\refname}{参考文献}
\\renewcommand{\\abstractname}{摘要}
\\renewcommand{\\indexname}{索引}
\\renewcommand{\\tablename}{表}
\\renewcommand{\\figurename}{图}
")



(defvar cn-article
  (concat en-article zh-preamble))

(defvar cn-beamer
  (concat en-beamer zh-preamble))


;(add-to-list 'load-path "~/.emacs.d/source-packages/org-mode-engine/")
(require 'ox-latex)
(require 'ox-beamer)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
	     `("article"
	       ,en-article
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
	      `("cn-article"
		,cn-article
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		("\\paragraph{%s}" . "\\paragraph*{%s}")
		("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
	      `("beamer"
		,en-beamer
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		("\\paragraph{%s}" . "\\paragraph*{%s}")
		("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
	      `("cn-beamer"
		,cn-beamer
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		("\\paragraph{%s}" . "\\paragraph*{%s}")
		("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(defadvice org-html-paragraph (before fsh-org-html-paragraph-advice
				      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let ((fixed-contents)
	(orig-contents (ad-get-arg 1))
	(reg-han "[[:multibyte:]]"))
    (setq fixed-contents (replace-regexp-in-string
			  (concat "\\(" reg-han
				  "\\) *\n *\\(" reg-han "\\)")
			  "\\1\\2" orig-contents))
    (ad-set-arg 1 fixed-contents)))



(provide 'cfg-org-mode)
