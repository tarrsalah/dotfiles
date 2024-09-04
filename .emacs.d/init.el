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
(setq auto-save-default nil)
(electric-pair-mode 1)
(electric-indent-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq shift-select-mode t)
(setq case-fold-search nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq mode-require-final-newline t)
(setq-default fill-column 80)
(setq initial-scratch-message ""
      inhibit-startup-message t
      initial-major-mode 'text-mode)
(define-coding-system-alias 'UTF-8 'utf-8)
(setq server-socket-dir "~/.emacs.d/server")
(windmove-default-keybindings)
;; (global-display-line-numbers-mode)


;; disable eldoc minibuffer
(setq eldoc-echo-area-use-multiline-p nil)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-dir)

(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


;; Theme colors
;; (set-face-background 'default "#ffffee")
(add-hook 'prog-mode-hook (lambda () (setq font-lock-defaults '(nil))))

(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Monaco 15"))

(if (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil :font "MonacoB 12" :weight 'semi-bold))

;; Compilation
(require 'compile)
(setq compilation-always-kill t)
(setq compilation-scroll-output t)

(add-to-list 'compilation-error-regexp-alist 'elixir)
(add-to-list 'compilation-error-regexp-alist-alist
             '(elixir "^\s\\(.*\\):\\([0-9]+\\):" 1 2))


;; packages
(setq package-enable-at-startup nil)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/"))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(package-install 'use-package)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; dired
(if (eq system-type 'darwin)
    (setq insert-directory-program "gls" dired-use-ls-dired t))

(setq dired-listing-switches "-al --group-directories-first")

(add-hook 'dired-load-hook
          (lambda () (require 'dired-x)))

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


;; global keys
(global-set-key (kbd "C-x r r") 'my/helm-git-grep)
(global-set-key (kbd "C-n") 'completion-at-point)


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


(use-package helm-ag
    :ensure t)

(eval-after-load 'helm
  (lambda ()
    (set-face-attribute
     'helm-source-header nil :height 140 :background nil)))

;; projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-use-git-grep t)
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

;; popup kill ring
;; (use-package popup-kill-ring
  ;; :ensure t
  ;; :bind (("M-y" . popup-kill-ring)))

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

(savehist-mode)

(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "GO111MODULE")

(defun spawn-shell (name)
  "Invoke shell test"
  (interactive "MName of shell buffer to create: ")
  (pop-to-buffer (get-buffer-create (generate-new-buffer-name (concat "**shell - " name "**"))))
  (shell (current-buffer)))



;; js-mode
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))
(add-hook 'js-mode-hook
	(lambda()
		(local-unset-key (kbd "M-."))))

(setq js-indent-level 2)
(setq typescript-indent-level 2)

(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'eglot-ensure)


(use-package prettier-js
    :ensure t)

(use-package add-node-modules-path
  :ensure t
  :custom
    (add-node-modules-path-command '("pnpm bin")))

(eval-after-load 'typescript-mode
  '(progn
     (add-hook 'typescript-mode-hook #'add-node-modules-path)))

(eval-after-load 'js-mode
    '(progn
     (add-hook 'js-mode-hook #'add-node-modules-path)))


;; typescript
(use-package typescript-mode
  :ensure t)

(define-derived-mode typescriptreact-mode web-mode "TypescriptReact"
  "A major mode for tsx.")

(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescriptreact-mode)))

(use-package eglot
  :ensure t
  :defer 3
  :hook
  ((js-mode
    typescript-mode
    typescriptreact-mode) . eglot-ensure)
  :config
  (cl-pushnew '((js-mode typescript-mode typescriptreact-mode) . ("typescript-language-server" "--stdio"))
              eglot-server-programs
              :test #'equal))

(setopt eglot-events-buffer-size 0)

;; golang
(use-package go-mode
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  :ensure t)


(setq-default eglot-workspace-configuration
    '((:gopls .
        ((buildFlags . ["--tags=integration"])))))

(add-hook 'go-mode-hook 'eglot-ensure)

;;auto-virtualenv
(use-package auto-virtualenv
  :ensure t
  :init
  (use-package pyvenv
    :ensure t)
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv))


(use-package ruff-format
    :ensure t
    :config
    (add-hook 'python-mode-hook 'ruff-format-on-save-mode))

(add-hook 'python-mode-hook 'eglot-ensure)

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

;; haskell
(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent))

;; web-mode
(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 4)
  (web-mode-css-indent-offset 4)
  (web-mode-code-indent-offset 4)
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

;; project
(require 'project)

(defun project-find-go-module (dir)
  "Find go module in DIR."
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  "Find PROJECT root."
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

;;; org-mode
(require 'org)

;;; babel-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t) (python . t)))

;;; gdb
(setq-default gdb-display-io-nopopup t)

;; latex
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("Latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run Latexmk on file")
    TeX-command-list)))

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
(put 'downcase-region 'disabled nil)
