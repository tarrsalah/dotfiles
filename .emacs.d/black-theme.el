;;; black-theme.el --- Colorless less whit theme

;; Copyright (C) 2021 Salah Eddine Taouririt <tarrsalah@gmail.com>

;;
;; Author: Salah Eddine Taouririt <tarrsalah@gmail.com>
;; Created: November 2021
;; Version: 1.0
;; Package-Requires: ((emacs "26.0"))
;; URL: https://github.com/tarrsalah/emacs-black-theme

;;; Commentary:
;; Colorless black theme

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(deftheme black "Colorless black theme")

(let* ((black/bg "#111")
       (black/bg1 "#444")
       (black/bg2 "#666")
       (black/fg "#aaa")
       (black/strings "#cf6a4c"))

  (custom-theme-set-faces
   `black
   `(default ((t (:foreground ,black/fg :background ,black/bg))))
   `(region  ((t (:background ,black/bg2))))
   ;; mode line
   `(linum ((t :foreground ,black/strings)))

   ;; hl-line
   `(hl-line ((t :background ,black/bg1)))

   ;;; no syntax highlighto
   `(font-lock-builtin-face		((t (:foreground ,black/fg))))
   `(font-lock-function-name-face	((t (:foreground ,black/fg))))
   `(font-lock-keyword-face		((t (:foreground ,black/fg))))
   `(font-lock-preprocessor-face	((t (:foreground ,black/fg))))
   `(font-lock-type-face		((t (:foreground ,black/fg))))
   `(font-lock-constant-face		((t (:foreground ,black/fg))))
   `(font-lock-variable-name-face	((t (:foreground ,black/fg))))

   ;; except for strings and comments
   `(font-lock-string-face		((t (:foreground ,black/strings))))
   `(font-lock-comment-face		((t (:foreground ,black/strings))))
   `(font-lock-comment-delimiter-face	((t (:foreground ,black/strings))))
   `(font-lock-doc-string-face ((t (:foreground ,black/strings))))
   `(font-lock-doc-face ((t (:foreground ,black/strings))))
   `(font-lock-preprocessor-face ((t (:foreground ,black/strings))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,black/strings))))

   `(helm-selection ((t (:background ,black/bg1 :underline nil))))
   `(helm-selection-line ((t (:background ,black/bg1))))



   ;; php
   `(php-doc-annotation-tag ((t (:foreground ,black/strings))))
   `(php-doc-class-name ((t (:foreground ,black/strings))))
   `(php-doc-$this-sigil ((t (:foreground ,black/strings))))
   `(php-doc-variable-sigil ((t (:foreground ,black/strings))))
   `(php-doc-$this ((t (:foreground ,black/strings))))
   `(php-type ((t (:foreground ,black/strings))))


   `(font-lock-warning-face		((t (:foreground "red" :bold t))))
   `(dired-directory ((t (:foreground ,black/strings))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


;;;###autoload
(defun black-theme()
  "Apply the black theme."
  (interactive)
  (load-theme 'black t))

(provide 'black-theme)
;;; black-theme.el ends here
