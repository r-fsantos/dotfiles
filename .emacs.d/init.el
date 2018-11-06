;;; init.el --- My init file.

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

;; Load path setup

;; From https://github.com/bodil/ohai-emacs/blog/master/init.el
;; Figure out the path to our .emacs.d by getting the path part of the
;; current file (`init.el`).
(defvar dotfiles-dir
  (file-name-directory
   (or (buffer-file-name) (file-chase-links load-file-name))))

(add-to-list 'load-path (concat dotfiles-dir "lisp"))

;; Tell Emacs a bit about me
(setq user-full-name "Mathew Robinson"
      user-mail-address "chasinglogic@gmail.com")

;;;; Package setup

(require 'package)
(package-initialize)
(setq package-check-signature nil)

(setq-default package-archives
 (list
  '("elpa" . "http://elpa.gnu.org/packages/")
  '("org" . "http://orgmode.org/elpa/")
  '("melpa" . "http://melpa.org/packages/")))

(package-initialize)
(package-refresh-contents)

;; Setup use-package

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Dependencies I use

(use-package dash :demand)
(use-package exec-path-from-shell :demand
  :config
  (exec-path-from-shell-initialize))

;;;; Global variables

(setq custom-file "~/.custom.el")
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt
	mac-command-modifier 'meta))

;; don't put auto saves in same dir as file
(when (not (file-directory-p "~/.saves"))
  (make-directory "~/.saves"))

(setq backup-directory-alist `((".*" . "~/.saves")))

;; show scratch buffer by default
(setq inhibit-splash-screen t)

;; spaces not tabs
(setq-default indent-tabs-mode nil)

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; smooth out scrolling
(setq scroll-step 1)
(setq scroll-margin 1)
(setq scroll-conservatively 9999)

;; auto pair things
(electric-pair-mode 1)

(require 'chasinglogic-gui)
(require 'chasinglogic-evil)
(require 'chasinglogic-web)
(require 'chasinglogic-go)
;; (require 'chasinglogic-cpp)
(require 'chasinglogic-rust)
(require 'chasinglogic-vala)
(require 'chasinglogic-java)
(require 'chasinglogic-org)
(require 'chasinglogic-python)
(require 'chasinglogic-markdown)
(require 'chasinglogic-powershell)
(require 'chasinglogic-terraform)
(require 'chasinglogic-writing)
(require 'chasinglogic-autocomplete)
(require 'chasinglogic-flycheck)
(require 'chasinglogic-git)
(require 'chasinglogic-ops)
(require 'chasinglogic-snippets)
(require 'chasinglogic-frames)
(require 'chasinglogic-projectile)
(require 'chasinglogic-keybinds)

;; maxmize a gui frame on creation
(defun maximize-gui-frames (frame)
  (with-selected-frame frame
    (when (display-graphic-p)
      (toggle-frame-maximized))))

(add-hook 'after-make-frame-functions 'maximize-gui-frames)

;; Start server if not running
(unless (and (fboundp 'server-running-p)
             (server-running-p))
  (server-start))

;; Emacs 26 boiiiiii
(unless (version< emacs-version "26.0")
  (defun chasinglogic-enable-line-numbers-hook ()
    (display-line-numbers-mode 1))
  (add-hook 'prog-mode-hook 'chasinglogic-enable-line-numbers-hook))

(when (file-exists-p "~/.secrets.el")
  (load-file "~/.secrets.el"))

(maximize-gui-frames (selected-frame))

;;; init.el ends here
