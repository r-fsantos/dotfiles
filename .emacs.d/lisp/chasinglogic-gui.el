;;; chasinglogic-gui.el --- changes the ui of emacs

;; Copyright (C) 2018 Mathew Robinson

;; Author: Mathew Robinson <chasinglogic@gmail.com>
;; Created: 24 Aug 2018

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;

;;; Code:

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-light t))

(use-package diminish
  :demand
  :config
  (diminish 'auto-revert-mode)
  (diminish 'abbrev-mode)
  (diminish 'global-undo-tree-mode)
  (diminish 'undo-tree-mode)
  (diminish 'eldoc-mode))

;; Font
(when (display-graphic-p)
  (set-frame-font "Hack-16" nil t))

(provide 'chasinglogic-gui)

;;; chasinglogic-gui.el ends here
