;;; package --- Personel emacs configurations
;;; Commentary:
;;; Code:

(setq debug-on-error t)
(setq debug-on-quit t)


;; global settings
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(delete-selection-mode 1)
(global-hl-line-mode 1)
(menu-bar-mode 0)
(global-auto-revert-mode)
(set-window-margins nil 2)
(electric-pair-mode 1)
(electric-indent-mode 0)
(global-linum-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq shift-select-mode t)
(setq compilation-always-kill t)

(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 6
 version-control t)


(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq mode-require-final-newline t)

(setq initial-scratch-message ""
      inhibit-startup-message t)

(define-coding-system-alias 'UTF-8 'utf-8)



;;; global key bindings
(global-set-key (kbd "C-x r r") 'rgrep)


;; packages
(setq package-enable-at-startup nil)

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(package-install 'use-package)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; themes
(load "~/.emacs.d/themes/emacs-acme-theme/acme-theme.el")
(load-theme 'acme t)
(set-face-attribute 'default nil :family "FiraCode" :height 100)

;; dired
(add-hook 'dired-load-hook
          '(lambda () (require 'dired-x)))
(setq dired-omit-mode t)
(setq dired-omit-files "\\.pdf$\\|\\.pyc$\\|\\.tern-port$\\|__pycache__|\\.php_cs.cache$")
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-listing-switches
      "-laXGh1v --group-directories-first")

;; ido
(use-package ido
  :ensure t
  :config
  (setq ido-create-new-buffer 'always)
  (global-set-key (kbd "C-b") 'ido-switch-buffer)
  (ido-mode)
  (ido-everywhere))

;; ido flex
(use-package flx-ido
  :ensure t
  :config
  (progn
    (flx-ido-mode 1)
    (setq ido-use-faces nil)
    (setq ido-enable-flex-matching t)
    (setq ido-enable-prefix t)
    (setq ido-enable-flex-matching t)))


;; ido-vertical-mode
(use-package ido-vertical-mode
  :ensure t
  :config (ido-vertical-mode))

;; company
(use-package company
  :ensure t
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (progn
    (setq company-tooltip-limit 10)
    (setq company-idle-delay 1)
    (setq company-echo-delay 0)
    (setq company-begin-commands '(self-insert-command)))
  :bind (("C-n" . company-complete)))

;; company-lsp
(use-package company-lsp
  :ensure t
  :commands company-lsp)

;; projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)
  (setq projectile-project-search-path '("~/src/emploitic/" "~/src/github.com/tarrsalah"))
  (setq projectile-switch-project-action 'projectile-dired)
  (projectile-mode +1))

;; smex
(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex))

;; magit
(use-package magit
  :ensure t
  :bind (("C-x g". magit-status))
  :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

;; forge
(use-package forge
  :ensure t
  :after magit)

;; popup kill ring
(use-package popup-kill-ring
  :ensure t
  :bind (("M-y" . popup-kill-ring)))

;; markdown
(use-package markdown-mode
  :ensure t)

;;; ibuffer
(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))

;;; expand region
(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

;;; lsp-mode
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred)
  :hook (php-mode . lsp-deferred)
  :config
  (progn
    (setq lsp-enable-file-watchers t)
    (setq lsp-file-watch-threshold 40000)))

;;; lsp-ui
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config (progn
            (setq lsp-ui-sideline-enable nil)
            (setq lsp-ui-doc-enable nil)))

;; exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-arguments '("-i"))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "GOPATH")

;; flycheck
(use-package flycheck
  :diminish flycheck-mode
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))

  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist)))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

;; javascript
(use-package js2-mode
  :ensure t
  :init
  (progn
    (add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
    (setq js2-mode-show-parse-errors nil)
    (setq js2-mode-show-strict-warnings nil)
    (setq js2-strict-missing-semi-warning nil)
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
    (add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))))

;; prettire
(use-package prettier-js
    :ensure t)

;; golang
(use-package go-mode
  :ensure t)

;; go hooks
(defun lsp-go-install-save-hooks ()
  "Install save hooks."
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; erlang
(setq erlang-electric-commands '())

;; elixir
(use-package elixir-mode
  :ensure t
  :config)

;; web-mode
(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  :config
  (progn
    (setq web-mode-enable-auto-indentation nil)
    (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl.php\\'" . web-mode))))

;; php
(use-package php-mode
  :ensure t)

;; emmet-mode
(use-package emmet-mode
  :ensure t
  :config
  (progn
    (add-hook 'web-mode-hook 'emmet-mode)
    (add-hook 'js2-mode 'emmet-mode)
    (add-hook 'html-mode-hook 'emmet-mode)
    (add-hook 'css-mode 'emmet-mode)
    (add-hook 'less-css-mode 'emmet-mode)))

;; docker
(use-package dockerfile-mode
  :ensure t)

;; nginx
(use-package nginx-mode
  :ensure t)

;; apache
(use-package apache-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.conf\\'" . apache-mode)))

;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (progn
    (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
    (yas-global-mode 1)))

;; dump-jump
(use-package dumb-jump
  :ensure
  :bind (("C-x j j" . dumb-jump-go) ("C-x j b" . dumb-jump-back)))

;; pass
(use-package pass
  :ensure t)

;; yaml
(use-package yaml-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.yaml.dist\\'" . yaml-mode))))

;;; trun of debugging
(setq debug-on-error nil)
(setq debug-on-quit nil)
(setq ring-bell-function 'ignore)

;; custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

(provide 'init)
;;; init.el ends here
