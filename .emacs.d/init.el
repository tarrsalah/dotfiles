;;; package --- Personel emacs configurations
;;; Commentary:
;;; Code:

(setq debug-on-error t)
(setq debug-on-quit t)

;; global settings
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(delete-selection-mode 1)
(global-hl-line-mode 1)
(setq auto-save-default nil)
(electric-pair-mode 1)
(electric-indent-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(setq shift-select-mode t)
(global-linum-mode t)
(global-hl-line-mode 0)
(setq case-fold-search nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(global-hl-line-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq mode-require-final-newline t)

(setq initial-scratch-message ""
      inhibit-startup-message t
      initial-major-mode 'text-mode)
(define-coding-system-alias 'UTF-8 'utf-8)

(set-face-attribute 'default nil :font "FiraCode-12.5" )

;;; dark
(set-face-foreground 'default "#fff")
(set-face-background 'default "#121212")
(set-face-foreground 'font-lock-string-face "#fff")
(add-hook 'prog-mode-hook (lambda () (setq font-lock-defaults '(nil))))

;;; white
;; (set-face-foreground 'default "#000")
;; (set-face-background 'default "#ffffdd")
;; (set-face-foreground 'font-lock-string-face "#000")
;; (set-face-attribute 'highlight nil :background "#E8E8E8" :foreground 'unspecified)
;; (set-face-attribute 'region nil :foreground 'unspecified :background "#bbffbb")
;; (add-hook 'prog-mode-hook (lambda () (setq font-lock-defaults '(nil))))

;; compilation
(require 'compile)
(setq compilation-always-kill t)
(setq compilation-scroll-output t)

(add-to-list 'compilation-error-regexp-alist 'elixir)
(add-to-list 'compilation-error-regexp-alist-alist
             '(elixir "^\s\\(.*\\):\\([0-9]+\\):" 1 2))

(require 'ansi-color)
(add-hook 'compilation-filter-hook
    (lambda()
      (ansi-color-apply-on-region compilation-filter-start (point))
      (read-only-mode)))

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

;; dired
(add-hook 'dired-load-hook
          '(lambda () (require 'dired-x)))

(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)))


(setq dired-omit-mode t)
(setq dired-omit-files "\\.pdf$\\|\\.pyc$\\|\\.tern-port$\\|__pycache__|\\.php_cs.cache$")
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-listing-switches
      "-laXGh1v --group-directories-first")

(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map [mouse-2] 'dired-mouse-find-file)))


;; ido-completing-read+
(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

;; helm
(use-package helm
  :ensure t
  :bind
    (("C-b" . 'switch-to-buffer)
     ("M-x" . 'helm-M-x))
  :config
    (helm-mode 1))

(defun my/helm-git-grep (NOT-ALL)
  "Helm git grep NOT-ALL."
  (interactive "P")
  (helm-grep-git-1 default-directory (null NOT-ALL)))

(global-set-key (kbd "C-x r r") 'my/helm-git-grep)

(use-package helm-ag
    :ensure t)

(eval-after-load 'helm
  (lambda ()
    (set-face-attribute
     'helm-source-header nil :height 140 :background nil)))

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
  :bind (("M-n" . company-complete)))

;; projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p o") 'projectile-run-vterm)
  (setq projectile-indexing-method 'alien)
  (setq projectile-switch-project-action 'projectile-dired)
  (add-to-list 'projectile-globally-ignored-directories "*deps")
  (with-current-buffer (window-buffer) (projectile-project-root))
  (projectile-mode +1))

;; magit
(use-package magit
  :ensure t
  :bind (("C-x g". magit-status))
  :config
  (setq magit-display-buffer-function
      (lambda (buffer)
        (display-buffer buffer '(display-buffer-same-window))))
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

;; exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-arguments '("-i"))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "GO111MODULE")

;; flycheck
(use-package flycheck
  :diminish flycheck-mode
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint haskell-stack-ghc haskell-ghc)))

  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist)))
  (flycheck-add-mode 'javascript-eslint 'web-mode))


;; js-mode
(setq js-indent-level 2)

;; js-comint
(use-package js-comint
  :config
  (setq inferior-js-program-command "nodejs")
  (setenv "NODE_NO_READLINE" "1"))


;; prettier
(use-package prettier-js
    :ensure t)

(eval-after-load 'typescript-mode
    '(progn
       (add-hook 'typescript-mode-hook #'add-node-modules-path)))

;; golang
(use-package go-mode
  :ensure t)

;; python
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

;; typescript
(use-package typescript-mode
  :ensure t
  :config
  (progn
    (setq-default typescript-indent-level 2)
    (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))))

(use-package company :ensure t)
(use-package flycheck :ensure t)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)



;; erlang
(use-package erlang
  :ensure t
  :config
  (setq erlang-electric-commands '())
  (add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil))))

;; elixir
(use-package elixir-mode
  :ensure t
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

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
  :ensure t
  :config
    (setq dumb-jump-prefer-searcher 'ag)
    (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

;; pass
(use-package pass
  :ensure t)

;; yaml
(use-package yaml-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.yaml.dist\\'" . yaml-mode))))

;; sqlformat
(use-package sqlformat
  :ensure t)

;; elgot
(require 'project)

(defun project-find-go-module (dir)
  "Find go module in DIR."
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  "Find PROJECT root."
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

;;; lsp-mode
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-enable-file-watchers nil)
  :hook (
         (typescript-mode . lsp)
         (js-mode . lsp)
         (go-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;;; org-mode
(require 'org)

;;; babel-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)))

(defun eglot-format-buffer-on-save ()
  "Format before save."
  (add-hook 'before-save-hook #'eglot-format-buffer -10 t))

(add-hook 'go-mode-hook #'eglot-format-buffer-on-save)

;;; term

(use-package vterm
  :ensure t
  :config
  (define-key vterm-mode-map (kbd "C-b") #'switch-to-buffer))

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
(put 'erase-buffer 'disabled nil)
