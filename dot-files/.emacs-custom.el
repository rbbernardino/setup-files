;;------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace nil)
 '(LaTeX-font-list
   (quote
    ((8 "\\hlt{" "}")
     (1 "" "" "\\mathcal{" "}")
     (2 "\\textbf{" "}" "\\mathbf{" "}")
     (3 "\\textsc{" "}")
     (5 "\\emph{" "}")
     (6 "\\textsf{" "}" "\\mathsf{" "}")
     (9 "\\textit{" "}" "\\mathit{" "}")
     (13 "\\textmd{" "}")
     (14 "\\num{" "}")
     (18 "\\textrm{" "}" "\\mathrm{" "}")
     (19 "\\textsl{" "}" "\\mathbb{" "}")
     (20 "\\texttt{" "}" "\\mathtt{" "}")
     (21 "\\textup{" "}")
     (4 "" "" t)
     (15 "\\textnormal{" "}" "\\mathnormal{" "}"))))
 '(LaTeX-includegraphics-extensions (quote ("eps" "jpe?g" "pdf" "png")))
 '(LaTeX-includegraphics-read-file (quote LaTeX-includegraphics-read-file-relative))
 '(LaTeX-item-indent 0)
 '(TeX-command-list
   (quote
    (("LatexMk" "latexmk %(-PDF)%S%(mode) %(file-line-error) %(extraopts) %t" TeX-run-latexmk nil
      (plain-tex-mode latex-mode doctex-mode)
      :help "Run LatexMk")
     ("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t t :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-electric-math (quote ("$" . "$")))
 '(TeX-electric-sub-and-superscript t)
 '(TeX-font-list
   (quote
    ((8 "{\\hl" "}")
     (2 "{\\bf " "}")
     (3 "{\\sc " "}")
     (5 "{\\em " "\\/}")
     (9 "{\\it " "\\/}")
     (18 "{\\rm " "}")
     (19 "{\\sl " "\\/}")
     (20 "{\\tt " "}")
     (4 "" "" t))))
 '(TeX-output-view-style
   (quote
    (("^dvi$"
      ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$")
      "%(o?)dvips -t landscape %d -o && gv %f")
     ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f")
     ("^dvi$"
      ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$")
      "%(o?)xdvi %dS -paper a4r -s 0 %d")
     ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d")
     ("^dvi$"
      ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$")
      "%(o?)xdvi %dS -paper a5r -s 0 %d")
     ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d")
     ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d")
     ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d")
     ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d")
     ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d")
     ("^dvi$" "." "%(o?)xdvi %dS %d")
     ("^pdf$" "." "okular %o")
     ("^html?$" "." "firefox %o"))))
 '(TeX-save-query nil)
 '(TeX-source-correlate-mode t)
 '(TeX-view-program-list nil)
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(auto-completion-min-chars (quote (global . 3)))
 '(auto-hscroll-mode (quote current-line))
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("65533f61159a00d88537d301747d4134116532c44cea994e5ba5f04bbfe5405c" default)))
 '(elpy-rpc-backend nil t)
 '(fill-column 80)
 '(inhibit-startup-screen t)
 '(ispell-personal-dictionary nil)
 '(package-selected-packages
   (quote
    (ess-view ess-smart-underscore ess fic-mode powershell focus sed-mode see-mode fzf wc-mode visual-regexp-steroids visual-fill-column unfill sr-speedbar pythonic python-mode paradox multiple-cursors modeline-posn meghanada matlab-mode markdown-preview-mode markdown-preview-eww latexdiff latex-pretty-symbols json-mode hl-line+ google-translate google-this git-gutter-fringe gh-md ggtags flymd flycheck-irony erlang elpy ein desktop+ company-shell company-jedi company-irony-c-headers company-irony company-flx company-distel company-c-headers company-auctex bash-completion auctex-latexmk)))
 '(paradox-automatically-star t)
 '(reftex-cite-format
   (quote
    ((13 . "\\cite[]{%l}")
     (111 . "\\citeonline[]{%l}")
     (121 . "\\citeyear[]{%l}")
     (97 . "\\citeauthoronline[]{%l}"))))
 '(reftex-plug-into-AUCTeX t)
 '(tabbar-separator (quote (0.3)))
 '(tool-bar-mode nil)
 '(whitespace-style
   (quote
    (face space-before-tab empty space-after-tab indentation face lines trailing))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#522514" :weight bold))))
 '(line-number-current-line ((t (:inherit line-number :foreground "white smoke" :weight extra-bold))))
 '(region ((t (:background "dim gray"))))
 '(tabbar-button ((t (:background "#3F3F3F" :foreground "#DCDCCC" :box (:line-width 1 :color "grey20" :style released-button)))))
 '(tabbar-selected ((t (:background "gray75" :foreground "black" :box (:line-width -1 :color "gray75" :style pressed-button)))))
 '(tabbar-unselected ((t (:background "gray30" :foreground "white" :box (:line-width -1 :color "gray30" :style released-button)))))
 '(whitespace-empty ((t (:background "red" :foreground "white"))))
 '(whitespace-indentation ((t (:background "red" :foreground "yellow" :weight bold))))
 '(whitespace-line ((t (:background "violet" :foreground "yellow" :weight bold))))
 '(whitespace-space-after-tab ((t (:background "red" :foreground "yellow" :weight bold))))
 '(whitespace-space-before-tab ((t (:background "red" :foreground "yellow" :weight bold)))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
