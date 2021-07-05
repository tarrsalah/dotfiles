;;; white-theme.el --- Colorless less whit theme

;; Copyright (C) 2019 Salah Eddine Taouririt <tarrsalah@gmail.com>

;;
;; Author: Salah Eddine Taouririt <tarrsalah@gmail.com>
;; Created: November 2019
;; Version: 1.0
;; Package-Requires: ((emacs "26.0"))
;; URL: https://github.com/tarrsalah/emacs-white-theme

;;; Commentary:
;; Colorless white theme

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
(deftheme white "Colorless white theme")

(let* ((white/bgyellow "#ffffcc")
       (white/fg "#000")
       (white/darkblue "#000088")
       (white/lightblue "#5180B3")
       (white/darkgreen "#006600")
       (white/darkgray "#757575")
       (white/lightgray "#E8E8E8"))

  (custom-theme-set-faces
   `white
   `(default ((t (:foreground ,white/fg :background ,white/bgyellow))))
   `(region  ((t (:background "grey"))))

   ;; mode line
   `(linum ((t :foreground ,white/darkgray)))

   ;;; no syntax highlight
   `(font-lock-builtin-face		((t (:foreground ,white/fg))))
   `(font-lock-function-name-face	((t (:foreground ,white/fg))))
   `(font-lock-keyword-face		((t (:foreground ,white/fg))))
   `(font-lock-preprocessor-face	((t (:foreground ,white/fg))))
   `(font-lock-type-face		((t (:foreground ,white/fg))))
   `(font-lock-constant-face		((t (:foreground ,white/fg))))
   `(font-lock-variable-name-face	((t (:foreground ,white/fg))))

   ;; except for strings and comments
   `(font-lock-string-face		((t (:foreground ,white/darkgreen))))
   `(font-lock-comment-face		((t (:foreground ,white/lightblue))))
   `(font-lock-comment-delimiter-face	((t (:foreground ,white/lightblue))))
   `(font-lock-doc-string-face ((t (:foreground ,white/lightblue))))
   `(font-lock-doc-face ((t (:foreground ,white/lightblue))))
   `(font-lock-preprocessor-face ((t (:foreground ,white/lightblue))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,white/lightblue))))


   `(helm-header
     ((t (:foreground ,white/darkblue
                      :background ,white/lightgray
                      :underline nil
                      :box nil
                      :extend t))))
   `(helm-source-header
     ((t (:foreground ,white/darkblue
                      :background ,white/lightgray
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)
                      :extend t))))

   `(helm-selection ((t (:background "darkseagreen2" :underline nil))))
   `(helm-selection-line ((t (:background "darkseagreen2"))))

   ;; php
   `(php-doc-annotation-tag ((t (:foreground ,white/lightblue))))
   `(php-doc-class-name ((t (:foreground ,white/lightblue))))
   `(php-doc-$this-sigil ((t (:foreground ,white/lightblue))))
   `(php-doc-variable-sigil ((t (:foreground ,white/lightblue))))
   `(php-doc-$this ((t (:foreground ,white/lightblue))))
   `(php-type ((t (:foreground ,white/lightblue))))

   `(font-lock-warning-face		((t (:foreground "red" :bold t))))
   `(dired-directory ((t (:foreground ,white/darkblue))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


;;;###autoload
(defun white-theme()
  "Apply the white theme."
  (interactive)
  (load-theme 'white t))

(provide 'white-theme)
;;; white-theme.el ends here
