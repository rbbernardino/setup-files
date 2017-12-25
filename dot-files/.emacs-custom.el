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
 '(company-dabbrev-downcase nil)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
	("65533f61159a00d88537d301747d4134116532c44cea994e5ba5f04bbfe5405c" default)))
 '(elpy-rpc-backend nil)
 '(fill-column 80)
 '(inhibit-startup-screen t)
 '(ispell-personal-dictionary nil)
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
