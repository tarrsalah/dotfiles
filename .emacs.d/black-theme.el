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

(let* ((black/bg "#000")
       (black/fg "#aaa")
       (black/lightbg "#111")
       (black/lightgray "#EEDC82"))

  (custom-theme-set-faces
   `black
   `(default ((t (:foreground ,black/fg :background ,black/bg))))
   `(region  ((t (:background "grey"))))

   ;; mode line
   `(linum ((t :foreground ,black/lightgray)))

   ;; hl-line
   `(hl-line ((t :background ,black/lightbg)))

   ;;; no syntax highlight
   `(font-lock-builtin-face		((t (:foreground ,black/fg))))
   `(font-lock-function-name-face	((t (:foreground ,black/fg))))
   `(font-lock-keyword-face		((t (:foreground ,black/fg))))
   `(font-lock-preprocessor-face	((t (:foreground ,black/fg))))
   `(font-lock-type-face		((t (:foreground ,black/fg))))
   `(font-lock-constant-face		((t (:foreground ,black/fg))))
   `(font-lock-variable-name-face	((t (:foreground ,black/fg))))

   ;; except for strings and comments
   `(font-lock-string-face		((t (:foreground ,black/lightgray))))
   `(font-lock-comment-face		((t (:foreground ,black/lightgray))))
   `(font-lock-comment-delimiter-face	((t (:foreground ,black/lightgray))))
   `(font-lock-doc-string-face ((t (:foreground ,black/lightgray))))
   `(font-lock-doc-face ((t (:foreground ,black/lightgray))))
   `(font-lock-preprocessor-face ((t (:foreground ,black/lightgray))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,black/lightgray))))

   ;; php
   `(php-doc-annotation-tag ((t (:foreground ,black/lightgray))))
   `(php-doc-class-name ((t (:foreground ,black/lightgray))))
   `(php-doc-$this-sigil ((t (:foreground ,black/lightgray))))
   `(php-doc-variable-sigil ((t (:foreground ,black/lightgray))))
   `(php-doc-$this ((t (:foreground ,black/lightgray))))
   `(php-type ((t (:foreground ,black/lightgray))))

   `(font-lock-warning-face		((t (:foreground "red" :bold t))))
   `(dired-directory ((t (:foreground ,black/lightgray))))))

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
