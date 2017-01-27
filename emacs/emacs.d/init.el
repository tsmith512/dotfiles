(global-font-lock-mode 1)

; Package Manager with MELPA
(require 'package)
  (setq package-list '(monokai-theme php-mode scss-mode markdown-mode))

  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/"))

  ;; For important compatibility libraries like cl-lib
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-hook 'after-init-hook (lambda () (load-theme 'monokai t)))

; PHP setup
(require 'php-mode)
(setq auto-mode-alist
  (append '(("\.php$" . php-mode)
            ("\.theme$" . php-mode)
            ("\.module$" . php-mode)
            ("\.inc$" . php-mode)
            ("\.install$" . php-mode))
              auto-mode-alist))

; Fix PHP indentation of arrays because lining up arrays was terrible
; See: https://www.emacswiki.org/emacs/PhpMode#toc18
(add-hook 'php-mode-hook (lambda ()
  (defun ywb-php-lineup-arglist-intro (langelem)
  (save-excursion
    (goto-char (cdr langelem))
    (vector (+ (current-column) c-basic-offset))))
  (defun ywb-php-lineup-arglist-close (langelem)
    (save-excursion
      (goto-char (cdr langelem))
      (vector (current-column))))
  (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
  (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

; Sass setup
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)
(setq css-indent-offset 2)

; Indentation setup (2 spaces for all files by default)
(electric-indent-mode -1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-stop-list (number-sequence 2 100 2))

; Whitespace setup (newline at end of file, no trailing whitespace)
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Custom keybindings (including workarounds for PuTTY)
(define-key global-map [select] 'end-of-line)
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(define-key global-map [(meta up)] 'scroll-down-line)
(define-key global-map [(meta down)] 'scroll-up-line)

; Other things
(setq column-number-mode t)
