;;-*- Emacs-Lisp -*-
;Package install from melpa

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq package-check-signature nil)
(package-initialize)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(let ((default-directory  "~/.emacs.d/elpa/"))
(normal-top-level-add-subdirs-to-load-path))

;; If package-check-signature is allow-unsigned, don't
;; signal error when we can't verify signature because of
;; missing public key.  Other errors are still treated as
;; fatal (bug#17625).
;; (unless (and (eq package-check-signature 'allow-unsigned)
;;              (eq (epg-signature-status sig) 'no-pubkey))
;;   (setq had-fatal-error t))

;;Config of load path
(setq load-path
    (append (list nil
            (expand-file-name "~/.emacs.d/site-lisp//"))
	    load-path))


;;Start Buffer is Scrach Buffer 
(setq initial-buffer-choice t)

;; swap BS and DEL
(keyboard-translate ?\C-h ?\C-?)

(keyboard-translate ?\C-? ?\C-h)

;;Japanese language environment
(set-fontset-font t `japanese-jisx0208 (font-spec :family "IPAEXGothic"))

;; X11 specific
(when (eq window-system 'x)
(scroll-bar-mode -1)
 (set-default-font "terminus-15")
  ;; face
  (dolist (elem '((bold "LightGoldenrod")
		  (underline "PaleGreen")
		  (mode-line "white" "dark blue" bold)
		  (mode-line-inactive "dark blue" "white")
		  (link "PaleGreen")
		  (link-visited "salmon")
		  (font-lock-builtin-face "aquamarine1")
		  (font-lock-keyword-face "aquamarine1" nil bold)
		  (font-lock-function-name-face "aquamarine1" nil bold)

		  (font-lock-constant-face "aquamarine2")
		  (font-lock-variable-name-face "aquamarine2")
		  (font-lock-type-face "LightCyan" nil bold)
		  (font-lock-preprocessor-face "LightCyan")

		  (font-lock-warning-face "orange")
		  (font-lock-negation-char-face "orange")
		  (font-lock-regexp-grouping-backslash "orange")
		  (font-lock-regexp-grouping-construct "orange")

		  (font-lock-comment-face "orange red")
		  (font-lock-comment-delimiter-face "orange red")
		  (font-lock-string-face "orange red")
		  (font-lock-doc-face "orange red")))
    (set-face-attribute (car elem) nil
			:foreground (nth 1 elem)
			:background (nth 2 elem)
			:weight (or (nth 3 elem) 'normal))))

;;mew
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;;trr
(add-to-list 'load-path "~/.emacs-trr")
;;(require 'trr)


;;show ( and )
(show-paren-mode 1)

;;yes/no y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;;auto-complete mode "company"
(require 'python)
(require 'company)
(global-company-mode) ; 全バッファで有効にする
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2)	;デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
 (add-to-list 'company-backends 'company-jedi)
 (add-hook 'python-mode-hook 'my/python-mode-hook)

;;キーバインド変更
  ;;M-x describe-key-briefly でキーバインドの割り当てを確認
;;C-z Open shell
;; (define-key global-map (kbd "C-Z") 'shell)
;;C-c コピー
;;(define-key global-map (kbd "C-c") 'kill-ring-save)


;;"ti" `(text-scale-increase :which-key "text scale increase")

;;Black background
(set-face-background 'default "black")

;; Stop beep  
(setq ring-bell-function 'ignore)

;;Show time on mode-line
(display-time)

;;Show line number
(global-linum-mode )

;;high lineを表示
;;(global-hi-line-mode t)

;;doc-anotation-mode
(setq doc-view-scale-internally nil)
(add-hook 'doc-view-mode-hook
  	  '(lambda ()
	     (local-set-key "c" 'doc-annotate-add-annotation)
	     (local-set-key [mouse-1] 'doc-annotate-add-annotation)))
(autoload 'doc-annotate-mode "doc-annotate")
(autoload 'doc-annotate-add-annotation "doc-annotate")
(add-to-list 'auto-mode-alist '("\\.ant$" . doc-annotate-mode))

(put 'set-goal-column 'disabled nil)

;;error view flylint-mode
(autoload 'flylint-mode "flylint" nil t)
(add-hook 'python-mode-hook
	  '(lambda ()
	     (flylint-mode 1)))
(add-hook 'perl-mode-hook
	  '(lambda ()
	     (flylint-mode 1)))
(add-hook 'c-mode-hook
  	  '(lambda ()
	     (flylint-mode 1)))
(add-hook 'emacs-lisp-mode-hook
  	  '(lambda ()
	     (flylint-mode 1)))

;;pytrans config
(autoload 'pytrans-translate "pytrans" nil t)
(global-set-key "\C-cT" 'pytrans-translate)

(autoload 'rsync "rsync" nil t)
(global-set-key "\C-cR" 'rsync)
(global-set-key "\C-cP" 'insert-rsync-path)

;; (require 'tabbar)
;; ; turn on the tabbar
;; (tabbar-mode t)
;; ; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,

;;  )

::ここは変えない
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pangu-spacing auto-highlight-symbol helm-tail gnu-elpa-keyring-update elscreen helm-firefox helm dash undo-tree trr tabbar-ruler smartparens rainbow-delimiters magit git-link company-jedi auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;自動で()をつける(package : smartparens)
(smartparens-global-mode)

;;emacs 上で pdf にコメント
(global-set-key "\C-cD" 'insert-modification-notice)
  (defun insert-modification-notice ()
    "Insert today's date followed by your full name at the current point
  as a comment."
    (interactive)
      (cond ((or (eq major-mode 'latex-mode)
               (eq major-mode 'outline-mode))
           (save-excursion
             (insert (format "%%  -%s [" (user-login-name))
                     (format-time-string "%Y/%m/%d")
                     "]\n"))
           (forward-char 2))
          (t
           (insert (format "%s%s, %s by %s%s" 
                           (comment-start-with-space)
                           (substring (current-time-string) 4 10)
                           (substring (current-time-string) -4)
                           (user-full-name)
                           (or comment-end "")))
           (indent-according-to-mode))))

;===============
; jedi (package.elの設定より下に書く)
;===============
;; (require 'auto-complete)
;; (require 'epc)
;; (require 'auto-complete-config)
;; (require 'python)


;;;;; PYTHONPATH上のソースコードがauto-completeの補完対象になる ;;;;;
;; (setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages")
;; (require 'jedi)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;;Cell mode の定義
(autoload 'Cell-mode "cell")
(add-to-list 'auto-mode-alist '("\\.scl$" . Cell-mode))

(autoload 'write-memo "write-memo" nil t)
(define-key global-map (kbd "\C-xm") nil)
(define-key global-map (kbd "\C-xm") 'write-memo)

;;tab space に印をつける
;; (global-whitespace-mode 1)

;; folding mode
;; ref:https://www.emacswiki.org/emacs/FoldingMode
(autoload 'folding-mode          "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)
(if (require 'folding nil 'noerror)
        (folding-mode-add-find-file-hook)
  (message "Library `folding' not found"))

(add-hook 'folding-mode-hook
'(lambda ()
	     (local-set-key "\C-co" 'folding-toggle-show-hide)))

(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (folding-mode 1)))
(add-hook 'python-mode-hook
	  '(lambda ()
	     (folding-mode 1)))
(add-hook 'c-mode-hook
	  '(lambda ()
	     (folding-mode 1)))

(folding-add-to-marks-list 'ruby-mode "#{{{" "#}}}" nil t)
 (folding-add-to-marks-list 'python-mode "#{{" "#}}"  nil t)
(folding-add-to-marks-list 'c-mode "/*{{{" "/*}}}" nil t)
(folding-add-to-marks-list 'php-mode "//{"  "//}"  nil t)
(folding-add-to-marks-list 'prolog-mode "%{{{" "%}}}" nil t)

;; configration of helm
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files )
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; ;; elscreen config
;; (elscreen-start)
;; ;;; プレフィクスキーはC-z
;; (setq elscreen-prefix-key (kbd "C-z"))
;; (elscreen-start)
;; ;;; タブの先頭に[X]を表示しない
;; (setq elscreen-tab-display-kill-screen nil)
;; ;;; header-lineの先頭に[<->]を表示しない
;; (setq elscreen-tab-display-control nil)


(defun insert-file-name ()
  "Insert the full path file name into the current buffer."
  (interactive)
  (insert (buffer-file-name)
	  ;; (insert (buffer-file-name (window-buffer (minibuffer-selected-window))''
	  )
	  )

;; バッファを読み込んで実行
;; ref: https://www.emacswiki.org/emacs/ExecuteExternalCommand
(defun shell-command-on-buffer ()
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: ")))

(global-set-key (kbd "C-c C-q") 'shell-command-on-buffer)


;; pangu-spacing config (日本語と英語の間に空白を入れる)
 (require 'pangu-spacing)
(global-pangu-spacing-mode 1)

(add-hook 'org-mode-hook
           '(lambda ()
	      (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))
 ;; (setq pangu-spacing-real-insert-separtor t)


