;;; clwt-theme.el --- Colorless less whit theme

;; Copyright (C) 2019 Salah Eddine Taouririt <tarrsalah@gmail.com>

;;
;; Author: Salah Eddine Taouririt <tarrsalah@gmail.com>
;; Created: November 2019
;; Version: 1.0
;; Package-Requires: ((emacs "26.0"))
;; URL: https://github.com/tarrsalah/emacs-clwt-theme

;;; Commentary:
;; Colorless clwt like theme

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
(deftheme clwt "Colorless white theme")

(let* ((clwt/bgyellow "#fcfcfc")
       (clwt/fg "#000000")
       (clwt/darkblue "#000088")
       (clwt/lightblue "#5180B3")
       (clwt/darkgreen "#006600")
       (clwt/darkgray "#757575")
       (clwt/lightgray "#E8E8E8"))

  (custom-theme-set-faces
   `clwt
   `(default ((t (:foreground ,clwt/fg :background ,clwt/bgyellow))))
   `(region  ((t (:background "grey"))))

   ;; mode line
   `(linum ((t :foreground ,clwt/darkgray)))

   ;; hl-line
   `(hl-line ((t (:background ,clwt/lightgray))))

   ;;; no syntax highlight
   `(font-lock-builtin-face		((t (:foreground ,clwt/fg))))
   `(font-lock-function-name-face	((t (:foreground ,clwt/fg))))
   `(font-lock-keyword-face		((t (:foreground ,clwt/fg))))
   `(font-lock-preprocessor-face	((t (:foreground ,clwt/fg))))
   `(font-lock-type-face		((t (:foreground ,clwt/fg))))
   `(font-lock-constant-face		((t (:foreground ,clwt/fg))))
   `(font-lock-variable-name-face	((t (:foreground ,clwt/fg))))

   ;; except for strings and comments
   `(font-lock-string-face		((t (:foreground ,clwt/darkgreen))))
   `(font-lock-comment-face		((t (:foreground ,clwt/lightblue))))
   `(font-lock-comment-delimiter-face	((t (:foreground ,clwt/lightblue))))
   `(font-lock-doc-string-face ((t (:foreground ,clwt/lightblue))))
   `(font-lock-doc-face ((t (:foreground ,clwt/lightblue))))
   `(font-lock-preprocessor-face ((t (:foreground ,clwt/lightblue))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,clwt/lightblue))))

   ;; php
   `(php-doc-annotation-tag ((t (:foreground ,clwt/lightblue))))
   `(php-doc-class-name ((t (:foreground ,clwt/lightblue))))
   `(php-doc-$this-sigil ((t (:foreground ,clwt/lightblue))))
   `(php-doc-variable-sigil ((t (:foreground ,clwt/lightblue))))
   `(php-doc-$this ((t (:foreground ,clwt/lightblue))))
   `(php-type ((t (:foreground ,clwt/lightblue))))

   `(font-lock-warning-face		((t (:foreground "red" :bold t))))
   `(dired-directory ((t (:foreground ,clwt/darkblue))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


;;;###autoload
(defun clwt-theme()
  "Apply the clwt theme."
  (interactive)
  (load-theme 'clwt t))

(provide 'clwt-theme)
;;;; clwt-theme.el ends here
