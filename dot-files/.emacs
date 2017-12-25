;; ----------------- RUN THIS TO INSTALL FROM MELPA -------------
;; as a function to speedup emacs
;; (defun add-melpa()
  (require 'package) ;; You might already have this line
  (add-to-list 'package-archives
			   '("melpa" . "https://melpa.org/packages/"))
  (when (< emacs-major-version 24)
	;; For important compatibility libraries like cl-lib
	(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  ;; )
;; -----------------------------------------------------------

(package-initialize)

;; contagem de palavras e caracteres
(require 'wc-mode)
(setq wc-modeline-format "WC[%tc chars | %tw words]")

;; menu melhorado para atualizar e instalar pacotes
(require 'paradox)
(paradox-enable)
(setq paradox-github-token "382b9625cd4ab78e5b7bd6e92514fe571d79d45f")

;; para lidar com dead keys com o ibus ativado...
(require 'iso-transl)

;; desktop+ para melhor controle do desktop
(require 'desktop+)

;; transformar parágrafos em uma só linha
;; provides: unfill-paragraph, unfill-region, unfill-toggle
(require 'unfill)
(global-set-key (kbd "M-S-q") 'unfill-paragraph)

;; para aumentar a prioridade do UTF-8 na lista de coding systems
(prefer-coding-system 'utf-8)

;; for smooth scrolling and disabling the automatical recentering of emacs when moving the cursor
(setq-default
 scroll-margin 1
 scroll-conservatively 0
 scroll-up-aggressively 0.01
 scroll-down-aggressively 0.01)
;; (setq-default scroll-step 1)

(setq linum-format "%d ")
(global-linum-mode 1)
;; (size-indication-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; faz que ao colar ou digitar em região selecionada substitua o que tinha antes
(delete-selection-mode 1)

;; traduzir com o Google direto do emacs
;;     C-c t --> translate
;;     C-n/p --> on translation prompt, switch translation directions/lang
(require 'google-translate)
(require 'google-translate-smooth-ui)
(global-set-key "\C-ct" 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '(("en" . "pt") ("pt" . "en")))
(setq google-translate-pop-up-buffer-set-focus t)

;; configura multiple-cursors para escrever em várias linhas simultaneamente
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; configura visual-regexp-steroids para buscar com regexp do python
(require 'visual-regexp-steroids)
(define-key global-map (kbd "S-<f10>") 'vr/replace)
(define-key global-map (kbd "C-S-<f10>") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s

;;------------------------------------------------------------------------------
;; Configurar TAB

;; melhorar word forward/backward naviagtion
;; (require 'misc)

;;  Trocar identação por espaços para por tabs
(defun setar-identacao-tab()
	"Set to indent with TABS instead of spaces"
	(setq indent-tabs-mode t)
	(setq-default indent-tabs-mode t)

	;; Bind the TAB key
	(local-set-key (kbd "TAB") 'self-insert-command)
)

;; Garantir identação por espaços
(defun ident-with-spaces()
  (setq indent-tabs-mode nil)
  )

;(add-hook 'erlang-mode-hook 'setar-identacao-tab)
(add-hook 'fundamental-mode-hook 'setar-identacao-tab)
(add-hook 'markdown-mode-hook 'setar-identacao-tab)
(add-hook 'c++-mode 'ident-with-spaces())

;; largura do TAB
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)

;; marcar (selecionar) palavra no cursor
(defun my-mark-current-word (&optional arg allow-extend)
  "Put point at beginning of current word, set mark at end."
  (interactive "p\np")
  (setq arg (if arg arg 1))
  (if (and allow-extend
		   (or (and (eq last-command this-command) (mark t))
			   (region-active-p)))
	  (set-mark
	   (save-excursion
		 (when (< (mark) (point))
		   (setq arg (- arg)))
		 (goto-char (mark))
		 (forward-word arg)
		 (point)))
	(let ((wbounds (bounds-of-thing-at-point 'word)))
	  (unless (consp wbounds)
		(error "No word at point"))
	  (if (>= arg 0)
		  (goto-char (car wbounds))
		(goto-char (cdr wbounds)))
	  (push-mark (save-excursion
				   (forward-word arg)
				   (point)))
	  (activate-mark))))
(global-set-key (kbd "M-s") 'my-mark-current-word)


;;-----------------------------------------------------
;;           GIT
;;---------- +LENTO 0.2s
(add-to-list 'load-path "~/.emacs.d/git-emacs")
(require 'git-emacs)

(global-git-gutter-mode +1)

;; para usar conjuntamente com linum-mode
(git-gutter:linum-setup)

;; não sei o que faz
(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)
;;-----------------------------------------------------

;; Global key bindings.
(global-set-key (kbd "C-<f5>") 'compile)
;;(global-set-key [f8] 'whitespace-toggle-options)
(global-set-key [f2] 'ispell-word)
(global-set-key [f9] 'goto-line)
(global-set-key [f10] 'replace-string)
;; (global-set-key (kbd "S-<f10>") 'replace-regexp) ; replaced with visual-regexp
(global-set-key [f12] 'sr-speedbar-toggle)

;; ibuffer to list all open buffers (C-h m) for help
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; same as "Ctrl -->" in case I'm using laptop
(global-set-key (kbd "M-<right>") 'forward-word)

;; gdb keybinding
(global-set-key (kbd "C-<f9>") 'gdb) ; executa no modo debbuger
(global-set-key (kbd "C-S-<f9>") 'gud-run) ; executa no modo debbuger
(global-set-key (kbd "C-<f10>") 'gud-next) ; prox linha
(global-set-key (kbd "C-S-<f10>") 'gud-continue) ; prox linha
(global-set-key (kbd "C-<f11>") 'gud-step) ; entra na funcao
(global-set-key (kbd "C-<f12>") 'gud-finish) ; sai da funcao
;; (global-set-key (kbd "C-S-<f12>") 'gud-quit) ; sai da funcao
(global-set-key (kbd "C-S-b") 'gud-break) ; adiciona breakpoint

;; search all buffers
(global-set-key (kbd "C-S-s") 'multi-occur-in-matching-buffers)

(global-set-key (kbd "C-t") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c i") 'imenu)
(global-set-key (kbd "C-c r") 'revert-buffer)

;; Redimensionar windows (subdivisões dos buffers)
(global-set-key (kbd "S-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-M-<down>") 'shrink-window)
(global-set-key (kbd "S-M-<up>") 'enlarge-window)

;; Navegar pelas janelas
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<up>") 'windmove-up)

;; Navegar pelas janelas - alternativo (motivado pelo python-mode)
;;   sobrescreve padrão, de alternar entre buffers, porém o padrão
;;   já não é mais usado (prefiro C-S-<left/right> e C-S<PgDown/Up>)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <up>") 'windmove-up)

;; Salvar e recuperar desktop
(global-set-key (kbd "C-c d r") 'desktop-read)
(global-set-key (kbd "C-c d s") 'desktop-save)

(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)

;; load shell-script mode for bash files
(add-to-list 'auto-mode-alist '(".bash_aliases" . shell-script-mode))


;; Configura copiar e colar para caso não haja selected region,
;; aplicar na linha inteira. C-w afetam a linha inteira
(put 'kill-ring-save 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

(put 'kill-region 'interactive-form      
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

;; define função para deletar a linha atual e bind to C-S-d
(defun delete-current-line ()
  "Delete (not kill) the current line."
  (interactive)
  (save-excursion
    (delete-region
     (progn (forward-visible-line 0) (point))
     (progn (forward-visible-line 1) (point)))))

(global-set-key (kbd "C-S-d") 'delete-current-line)

;; ----------- +LENTO 0.07s
;; salva histórico de comandos, inclusive arquivos abertos recentemente
(savehist-mode 1)

;; --------------- +LENTO 0.09s
;; menu de arquivos recentes (em lista)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; configurando prompt do octave
(setq inferior-octave-prompt ">> ")

;;-----------------------------------------------
;;     Company auto complete    ;;
;; -------------- +LENTO 0.08s
;; auto complete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-x y") 'company-yasnippet)

;; configurar melhor depois para aceitar letras minúsculas
(setq company-show-numbers          t
	  ;; company-dabbrev-downcase      nil
	  ;;company-idle-delay            0
	  ;; company-minimum-prefix-length		2
	  )

(with-eval-after-load 'company
  (add-hook 'company-mode-hook(lambda()
								(add-to-list 'company-backends '(company-shell company-capf))))
  (company-flx-mode +1))

(global-set-key (kbd "C-<tab>") 'company-complete)
(global-set-key (kbd "<C-iso-lefttab>") 'company-files)

(setq
 company-irony-ignore-case t
 company-dabbrev-ignore-case t
 company-etags-ignore-case t
 ggtags-global-ignore-case t)

;;-----------------------------------------------
;;-----------------------------------------------
;; company compatibility with fci-mode...
(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
  (when (boundp 'fci-mode)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)

;; This piece of code modify the zoom in/out functionality to apply the commands to every buffer. That should achieve what you are trying to do.
;; (defadvice text-scale-increase (around all-buffers (arg) activate)
;;   (dolist (buffer (buffer-list))
;;     (with-current-buffer buffer
;;       ad-do-it)))

;;-----------------------------------------------
;; PROGRAMMING
;; camel case
(add-hook 'java-mode-hook 'subword-mode)
(add-hook 'c-mode-common-hook 'subword-mode)

;;-----------------------------------------------
;; Java
;; (require 'meghanada)
;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             ;; meghanada-mode on
;;             (meghanada-mode t)
;;             (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))

;;-----------------------------------------------
;;     C/C++ mode configs minor-modes hooks    ;;

;; snippets (ajustar compatibilidade com company
;(add-hook 'c-mode-hook 'yas-global-mode)
;(add-hook 'c++-mode-hook 'yas-global-mode)

;; sempre c++11
(add-hook 'c++-mode-hook
		  (lambda()	(setq
			 irony-additional-clang-options '("-std=c++11"))))

;; auto complete
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; flycheck para checar a sintaxe
(add-hook 'c++-mode-hook 'flycheck-mode)

; Disable clang check, gcc check works better
;; (flycheck-disable-checker
;; (setq-default flycheck-disabled-checkers
;; 	      '(append flycheck-disabled-checkers
;; 		      "c/c++-clang"))

; Enable C++11 support for gcc
;; (add-hook 'c++-mode-hook
;; 		  (lambda () (setq flycheck-gcc-language-standard "c++11")))

(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'objc-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)
  (eval-after-load 'company
	'(add-to-list
	  'company-backends '(company-irony-c-headers company-irony))
	;; (add-to-list 'company-backends 'company-c-headers)
	)
  )

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; ---------------------------------------------
;; !!!!!!!!  TENTAR DEPOIS usar SEMANTIC  !!!!!!!
;;
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-backends 'company-semantic)
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/5.4.0/")
;; (require 'cc-mode)
;; (require 'semantic)
;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (semantic-mode 1)
;; (semantic-add-system-include "/usr/include/c++/5.4.0/" 'c++-mode)
;; (semantic-add-system-include "~/linux/kernel")
;; (semantic-add-system-include "~/linux/include")

;;-------------------------------------------
;;      DEBUGGER
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;;-------------------------------------------

;(add-hook 'c-mode-hook 'whitespace-mode)

;;-----------------------------------------------
;; Navegar pelo código para c, c++ e java
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode 'matlab-mode 'octave-mode 'python-mode 'tex-mode 'shell-script-mode)
              (ggtags-mode 1))))

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
;;-----------------------------------------------

;; major modes to load
(add-to-list 'auto-mode-alist '("\\.yrl\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.xrl\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.cerl\\'" . erlang-mode))
;;(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
;;(add-to-list 'auto-mode-alist '("\\.bbl\\'" . latex-mode))

;; ----------------------------------------------------------------;;
;;     ...PYTHON...
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; jedi
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)                 ; optional

;; if you want to use the latest version (5+)
;; (setq python-shell-interpreter "ipython3"
;; 	  python-shell-interpreter-args "--simple-prompt -i")

;; ---------- LENTO: 0.6s
;; elpy
(elpy-enable)

;; removes bindings to Alt + arrows                                                                                  
(define-key elpy-mode-map (kbd "<M-left>") nil)
(define-key elpy-mode-map (kbd "<M-right>") nil)
(define-key elpy-mode-map (kbd "<M-up>") nil)
(define-key elpy-mode-map (kbd "<M-down>") nil)

;; to use IPython instead of usual python
(elpy-use-ipython "ipython3")

;; consider adding --pylab, import several things and allow inline graphs
;; linux colors to provide better reading with dark emacs
(setq python-shell-interpreter-args "--colors Linux")

;; for virtual environments
(defalias 'workon 'pyvenv-workon)

;; if you want to use the latest version (5+)
;; (setq python-shell-interpreter-args "--colors Linux --simple-prompt -i")

;; use jedi backend
;; (setq elpy-rpc-backend "jedi")

;; (eval-after-load 'company
;; 		  '(add-to-list 'company-backends 'company-jedi))

;; to avoid flood in mode line (Python Elpy yas AC ElDoc Fill)
;; (elpy-clean-modeline)

;; disable flymake so it may use flycheck instead
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; -----------------------------------------------------------------------------
;;            tabbar-mode com Tweaks

;; Tabbar
(require 'tabbar)

;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))
;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "gray30"
;;  :foreground "white"
;;  :box '(:line-width 5 :color "gray30" :style nil))
;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "gray75"
;;  :foreground "black"
;;  :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
;; (set-face-attribute
;;  'tabbar-button nil
;;  :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format " [%s] " (tabbar-tab-tabset tab))
                  (format " %s " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

;; -----------------------------------------------------------------------------
;; Tabbar keyboard shortcuts
;; C-PgUp  ;;  C-PgDown
(global-set-key [C-next] 'tabbar-forward-tab)
(global-set-key [C-prior] 'tabbar-backward-tab)
(global-set-key [C-S-home] 'tabbar-forward-group)
(global-set-key [C-S-end] 'tabbar-backward-group)
(global-set-key (kbd "C-c <right>") 'tabbar-forward-tab)
(global-set-key (kbd "C-c <left>") 'tabbar-backward-tab)
(global-set-key (kbd "C-c <up>") 'tabbar-forward-group)
(global-set-key (kbd "C-c <down>") 'tabbar-backward-group)
 ;; C-x C-<left> ;; C-x C-<right>
 ;; (global-set-key (kbd "C-x C-<right>") 'tabbar-forward-group)
 ;; (global-set-key (kbd "C-x C-<left>") 'tabbar-backward-group)

(tabbar-mode 1)

;; -----------------------------------------------------------------------------
;; Criptografia
;;     Todo arquivo .gpg que for aberto será criptografado
(require 'epa-file)
(epa-file-enable)

;; -----------------------------------------------------------------------------
;;          LATEX

;; hooks para flyspell
(add-hook `latex-mode-hook `flyspell-mode)
(add-hook `LaTeX-mode-hook `flyspell-mode)
(add-hook `tex-mode-hook `flyspell-mode)
(add-hook `bibtex-mode-hook `flyspell-mode)

;; hooks para company mode
(add-hook `latex-mode-hook `global-company-mode)
(add-hook `LaTeX-mode-hook `global-company-mode)
(add-hook `tex-mode-hook `global-company-mode)
(add-hook `bibtex-mode-hook `global-company-mode)

;; hook para yas snippets
(add-hook `latex-mode-hook `yas-minor-mode)
(add-hook `LaTeX-mode-hook `yas-minor-mode)
(add-hook `tex-mode-hook `yas-minor-mode)
(add-hook `bibtex-mode-hook `yas-minor-mode)

;;------------------------------------------------
;; CORRIGE BUG do includegraphics...
;;    extensões de imagens visíveis para auto-completar
;;    mudam para o padrão (só eps) toda VEZ!
;; (defmacro with-image-includegraphics (&rest body)
;;   "Evaluate body forms using the default definition of a paragraph."
;;   `(let ((LaTeX-includegraphics-extensions (quote ("eps" "jpe?g" "pdf" "png"))))
;;      ,@body))

;; (defalias 'my-TeX-insert-macro 'TeX-insert-macro)
;; (defadvice my-TeX-insert-macro
;;   (around my-TeX-insert-macro-advice activate)
;;   (with-image-includegraphics ad-do-it))

;; (defun my-TeX-insert-macro-overrides ()
;;   (local-set-key [remap TeX-insert-macro] 'my-TeX-insert-macro))

;; (add-hook 'LaTeX-mode-hook 'my-TeX-insert-macro-overrides)

;;------------------------------------------------
;; pular parágrafos entre linhas em branco nos modos especificados
(defmacro with-default-paragraph-definition (&rest body)
  "Evaluate body forms using the default definition of a paragraph."
  `(let ((paragraph-start (default-value 'paragraph-start))
         (paragraph-separate (default-value 'paragraph-separate)))
     ,@body))

(defalias 'my-mark-paragraph 'mark-paragraph)
(defadvice my-mark-paragraph 
  (around my-mark-paragraph-advice activate)
  (with-default-paragraph-definition ad-do-it))

(defalias 'my-forward-paragraph 'forward-paragraph)
(defadvice my-forward-paragraph
  (around my-forward-paragraph-advice activate)
  (with-default-paragraph-definition ad-do-it))

(defalias 'my-backward-paragraph 'backward-paragraph)
(defadvice my-backward-paragraph
  (around my-backward-paragraph-advice activate)
  (with-default-paragraph-definition ad-do-it))

(defun my-paragraph-overrides ()
  "Use the default paragraph definitions in * modes
        when marking or moving by paragraph."
  (local-set-key [remap mark-paragraph] 'my-mark-paragraph)
  (local-set-key [remap forward-paragraph] 'my-forward-paragraph)
  (local-set-key [remap backward-paragraph] 'my-backward-paragraph))
;;----------------------------------------------

;; set the default paragraph naviagtion in desired modes
(add-hook 'LaTeX-mode-hook 'my-paragraph-overrides)

;; Configura REFTEX
;;     Para uso de labels, refs, etc. melhorado
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'tex-mode-hook 'turn-on-reftex)
(add-hook 'bibtex-mode-hook 'turn-on-reftex)
(setq reftex-use-external-file-finders t)
(setq reftex-external-file-finders
	  '(("tex" . "kpsewhich -format=.tex %f")
		("bib" . "kpsewhich -format=.bib %f")))
(setq reftex-auto-recenter-toc t)
(setq reftex-toc-split-windows-horizontally t)
(global-set-key (kbd "C-c 0") 'reftex-reference)

;; estilo de citação ABNTEX
(eval-after-load 'reftex-vars
  '(progn
     ;; (also some other reftex-related customizations)
     (setq reftex-cite-format
           '((?\C-m . "\\cite[]{%l}")
             (?t . "\\citeonline[]{%l}")
             (?y . "\\citeyear[]{%l}")
             (?a . "\\citeauthoronline[]{%l}")
             ))))

;; find bibfile of current visiting document
;; (won't work if .tex file has same name as .bib file)
(defun mg-LaTeX-find-bibliography ()
  "Visit bibliography file of the current document."
  (interactive)
  (let ((length (length (LaTeX-bibliography-list)))
    bib)
    (if (= length 1)
    (progn
      (setq bib (car (car (LaTeX-bibliography-list))))
      (unless (file-name-extension bib)
        (setq bib (concat bib ".bib")))
      (mg-TeX-kpsewhich-find-file bib))
      (if (< length 1)
      ;; If there is no element in `LaTeX-bibliography-list' use a `.bib'
      ;; file with the same base name of the TeX master as an educated
      ;; guess.
      (mg-TeX-kpsewhich-find-file (TeX-master-file "bib"))
    (setq bib (completing-read "Bibliography database: "
                   (LaTeX-bibliography-list)))
    (unless (file-name-extension bib)
      (setq bib (concat bib ".bib")))
    (mg-TeX-kpsewhich-find-file bib)))))

;; compila com latexmk, sem necessitar rodar várias vezes o C-c C-c
(require 'auctex-latexmk)
(auctex-latexmk-setup)
(setq auctex-latexmk-inherit-TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook '(lambda () (setq TeX-command-default "LatexMk")))

;; faz com que C-c C-c sempre escolha LaTexMk
;; (setq TeX-command-force "LaTexMk")

;; ativa gerar pdf ao compilar
(setq TeX-PDF-mode t)

;; corrige visualizador de PDF para okular
(defun okular-view-LaTeX-mode()
  (add-to-list 'TeX-view-program-list '("Okular" "okular %o -p %(outpage)"))
  (setq TeX-view-program-selection '((output-pdf "Okular")))
  ; Other mode specific config
  )
(add-hook 'LaTeX-mode-hook 'okular-view-LaTeX-mode)

;; para transformar símbolos em imagens já na edição
(require 'latex-pretty-symbols)

;; get support for many of the LaTeX packages
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; sempre que abrir um novo .tex vai perguntar qual é o arquivo principal
;; para compilar
(setq-default TeX-master nil)

;; adiciona line breaks no final apenas visualmente (não altera buffer)
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'visual-fill-column-mode)

;; quebra linhas similarmente ao anterior, mas alterando o buffer (aplicar M-q)
;; original: http://pleasefindattached.blogspot.com/2011/12/emacsauctex-sentence-fill-greatly.html
(defadvice LaTeX-fill-region-as-paragraph (around LaTeX-sentence-filling)
  "Start each sentence on a new line."
  (let ((from (ad-get-arg 0))
        (to-marker (set-marker (make-marker) (ad-get-arg 1)))
		(fill-column 75)
		;(fill-column 95)
        tmp-end)
    (while (< from (marker-position to-marker))
      (forward-sentence)
      ;; might have gone beyond to-marker --- use whichever is smaller:
      (ad-set-arg 1 (setq tmp-end (min (point) (marker-position to-marker))))
      ad-do-it
      (ad-set-arg 0 (setq from (point)))
      (unless (or
               (bolp)
	  		   (looking-back "^\\s *")
               (looking-at "\\s *$"))
        (LaTeX-newline))
	  )
    (set-marker to-marker nil)))
(ad-activate 'LaTeX-fill-region-as-paragraph)

;; snippets úteis
;; (add-hook 'LaTeX-mode-hook
			;; BEAMER SNIPPETS
				;; (defun insert-frame-title()
				;; 	"Insert \frametitle{} at cursor point."
				;; 	(interactive)
				;; 	(insert "\\frametitle{}")
				;; 	(backward-char 1))

				;; (defun insert-frame-sub-title()
				;; 	"Insert \framesubtitle{} at cursor point."
				;; 	(interactive)
				;; 	(insert "\\framesubtitle{}")
				;; 	(backward-char 1))

				;; (defun insert-item()
				;; 	"Insert \item at cursor point."
				;; 	(interactive)
				;; 	(insert "\\item "))

				;; (defun insert-itemize()
				;; 	"Insert itemize template at cursor point."
				;; 	(interactive)
				;; 	(insert "\t\\begin{itemize}\n\t\t\\item \n\t\\end{itemize}")
				;; 	(backward-char 15))

				;; (defun insert-frame()
				;;     "Insert frame template at cursor point."
				;; 	(interactive)
				;; 	(insert "\\begin{frame}\n\n\\end{frame}")
				;; 	(backward-char 12))

				;; (defun insert-figure()
				;;     "Insert figure template at cursor point."
				;; 	(interactive)
				;; 	(insert "\\begin{figure}[!htp]\n\s\s\\centering\n\s\s\\includegraphics[width=0.75\\textwidth]{img/.pdf}\n\s\s\\caption{}\n\s\s\\label{fig:}\n\\end{figure}")
				;; 	(backward-char 46))
				;; (local-set-key (kbd "C-u C-f") 'insert-figure)

				;; (local-set-key (kbd "C-l f t") 'insert-frame-title)
				;; (local-set-key (kbd "C-l f s t") 'insert-frame-sub-title)
				;; (local-set-key (kbd "C-l i") 'insert-item)
				;; (local-set-key (kbd "C-l b i") 'insert-itemize)
				;; (local-set-key (kbd "C-l b f") 'insert-frame)
				;; (setq tex-item-indent 8)
			;; ))
;; -----------------------------------------------------------------------------
;; do carinha
;; (eval-after-load "tex"
;;   '(TeX-add-style-hook "beamer" 'my-beamer-mode))

;; (setq TeX-region "regionsje")
;; (defun my-beamer-mode ()
;;   "My adds on for when in beamer."

;;   ;; when in a Beamer file I want to use pdflatex.
;;   ;; Thanks to Ralf Angeli for this.
;;   (TeX-PDF-mode 1)                      ;turn on PDF mode.

;;   ;; Tell reftex to treat \lecture and \frametitle as section commands
;;   ;; so that C-c = gives you a list of frametitles and you can easily
;;   ;; navigate around the list of frames.
;;   ;; If you change reftex-section-level, reftex needs to be reset so that
;;   ;; reftex-section-regexp is correctly remade.
;;   (require 'reftex)
;;   (set (make-local-variable 'reftex-section-levels)
;;        '(("lecture" . 1) ("frametitle" . 2)))
;;   (reftex-reset-mode)

;;   ;; add some extra functions.
;;   (define-key LaTeX-mode-map "\C-cf" 'beamer-template-frame)
;;   (define-key LaTeX-mode-map "\C-\M-x" 'tex-frame)
;; )

;; (defun tex-frame ()
;;   "Run pdflatex on current frame.  
;; Frame must be declared as an environment."
;;   (interactive)
;;   (let (beg)
;;     (save-excursion
;;       (search-backward "\\begin{frame}")
;;       (setq beg (point))
;;       (forward-char 1)
;;       (LaTeX-find-matching-end)
;;       (TeX-pin-region beg (point))
;;       (letf (( (symbol-function 'TeX-command-query) (lambda (x) "LaTeX")))
;;         (TeX-command-region))
;;         )
;;       ))


;; (defun beamer-template-frame ()
;;   "Create a simple template and move point to after \\frametitle."
;;   (interactive)
;;   (LaTeX-environment-menu "frame")
;;   (insert "\\frametitle{}")
;;   (backward-char 1))
;; -----------------------------------------------------------------------------


;; -----------------------------------------------------------------------------
;; navegar pelas funções do código, mesmo atalho do Eclipse
(global-set-key (kbd "C-o") 'imenu)

;; -----------------------------------------------------------------------------
;; Ao deletar tabs, backspace não deve transformá-lo em espaços
;; (keyboard-translate ?\C-h ?\C-?)
;; (keyboard-translate ?\C-? ?\C-p) 
;; (global-set-key (kbd "C-p") 'delete-backward-char)

;; A gambiarra acima é pq por alguma razão a prox linha não funciona... =(
;(global-set-key "\C-h" 'delete-backward-char)

;; -----------------------------------------------------------------------------

;; seta o Control + Z para ser o desfazer
(global-set-key (kbd "C-z") 'undo-only)

;; Setando o Home / End - não funciona no terminal =(
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key [C-end]  'end-of-buffer)

;;------------------------------------------------------------------------------
;; colocar regua no final de fill-column
(add-to-list 'load-path "~/.emacs.d/mini-patches")
(require 'fill-column-indicator)

;; Define em quais modos carregar o fill-colimn-indicator
;; Define fci-mode sempre que o erlang-mode for chamado
(add-hook 'erlang-mode-hook 'fci-mode)
(add-hook 'matlab-mode-hook 'fci-mode)
(add-hook 'c-mode-common-hook 'fci-mode)

;; python
(add-hook 'python-mode-hook 'fci-mode)

;; ------------------------------------------------------------------------
;; Atalhos do Flyspell
;(global-set-key (kbd "C-S-<f2>") 'flyspell-mode)
;(global-set-key (kbd "C-M-<f2>") 'flyspell-buffer)
;(global-set-key (kbd "M-<f2>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "C-<f2>") 'flyspell-check-next-highlighted-word)

;; hooks
(add-hook `markdown-mode-hook `flyspell-mode)

;; -----------------------------------------------------------------------------
;; ===== Set the highlight current line minor mode =====
;; In every buffer, the line which contains the cursor will be fully highlighted
(require 'hl-line+)
(global-hl-line-mode 1)
;; (toggle-hl-line-when-idle 1) ; Highlight only when idle
;; (hl-line-when-idle-interval 2)

;; -----------------------------------------------------------------------------
;; Centralizar arquivos temporários

(defvar user-temporary-file-directory "~/temp/emacsBackup/")
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
;; Update for emacs23: delete excess backup versions silently
(setq delete-old-versions t)

;;---------------------------------------------------
;;          REVERT ALL BUFFERS
;;---------------------------------------------------
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files.") )

;;---------------------------------------------------
;;          Configurando o Erlang Mode
;;---------------------------------------------------
;; Erlang-mode
;; (require 'erlang-start)
;; (add-hook 'erlang-mode-hook
;;              (lambda ()
;;             ;; when starting an Erlang shell in Emacs, the node name
;;             ;; by default should be "emacs"
;;             (setq inferior-erlang-machine-options '("-sname" "emacs"))
;;             ;; add Erlang functions to an imenu menu
;;             (imenu-add-to-menubar "imenu")))

;;------------------------------------------------
;; Set by GUI custom changes
(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)