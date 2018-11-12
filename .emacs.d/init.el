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
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "TERM"))

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

;;; UI/UX

;; smooth out scrolling
(setq scroll-step 1)
(setq scroll-margin 1)
(setq scroll-conservatively 9999)

;; disable useless chrome
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; theme
(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-light t))

;; hide minor modes from modeline
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

;; auto pair things
(electric-pair-mode 1)
;; highlight parens
(show-paren-mode 1)

;; Ivy and Counsel

(use-package ivy :demand
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t)
  (ivy-mode 1))

(use-package smex :demand
  :config
  (smex-initialize))

(use-package counsel :demand
  :diminish counsel-mode
  :config
  (counsel-mode 1))

;;;; EVIL
(require 'chasinglogic-evil)

(use-package flycheck
  :diminish flycheck-mode
  :demand
  :init
  (global-flycheck-mode)

  (defun enable-flyspell ()
    (flyspell-mode 1))

  (defun enable-flyspell-prog ()
    (flyspell-prog-mode))

  (add-hook 'text-mode-hook 'enable-flyspell)
  (add-hook 'prog-mode-hook 'enable-flyspell-prog))

;; my frame management functions
(require 'chasinglogic-frames)
(require 'chasinglogic-git)
(require 'chasinglogic-gui)
(require 'chasinglogic-ivy)
(require 'chasinglogic-projectile)
(require 'chasinglogic-python)
(require 'chasinglogic-snippets)
(require 'chasinglogic-writing)
;; (require 'chasinglogic-autocomplete)
;; (require 'chasinglogic-web)

;;;; Additional Language Modes

(use-package powershell
  :commands (powershell-mode)
  :mode ("\\.ps1\\'" . powershell-mode))

(use-package groovy-mode
  :mode ("\\.groovy$" "\\.gradle$"))

(use-package yaml-mode
  :mode ("\\.yaml\\'" "\\.yml\\'"))

(use-package toml-mode
  :mode ("\\gitconfig\\'" "\\.toml\\'"))

(use-package markdown-mode
  :mode ("\\.markdown\\'" "\\.md\\'")
  :config (setq-default markdown-command "pandoc"))

(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)
  :config
  (defun enable-rustfmt-on-save ()
    (rust-enable-format-on-save t))
  (add-hook 'rust-mode-hook 'enable-rustfmt-on-save)

  (setq-default rust-format-on-save t)
  (unless (getenv "RUST_SRC_PATH")
    (exec-path-from-shell-copy-env "RUST_SRC_PATH")))

(use-package json-mode
  :mode ("\\.json\\'" ".babelrc" ".eslintrc")
  :config
  (add-hook 'json-mode-hook 'chasinglogic-js-mode-hook))

;; properly indent case statements
(c-set-offset 'case-label '+)
(use-package web-mode
  :commands (web-mode)
  :mode ("\\.html?\\'" "\\.tmpl\\'" "\\.css\\'"
	 "\\.scss\\'" "\\.erb\\'" "\\.djhtml\\'")
  :config
  (setq-default web-mode-markup-indent-offset 2
                web-mode-style-indent-offset 2
		web-mode-code-indent-offset 2))


;; Always load keybinds last
(require 'chasinglogic-keybinds)

(defun maximize-gui-frames (frame)
  "Maxmize a the GUI frame FRAME on creation."
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
