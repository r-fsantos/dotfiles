;;; chasinglogic-keybinds.el --- my keybindings

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

(use-package which-key
  :diminish which-key-mode
  :demand
  :config
  (which-key-mode))

(use-package general
  :demand
  :config
  (require 'chasinglogic-utils)

  ;; Make space work everywhere
  (setq-default
   general-override-states '(insert
			     emacs
			     hybrid
			     normal
			     visual
			     motion
			     operator
			     replace))

  ;; (defvar chasinglogic-errors-map (make-keymap))
  ;; (general-define-key
  ;;  :keymaps 'chasinglogic-errors-map
  ;;  "l" 'flycheck-list-errors
  ;;  "n" 'flycheck-error-list-next-error
  ;;  "p" 'flycheck-error-list-previous-error)

  (defvar chasinglogic-files-map (make-keymap))
  (general-define-key
   :keymaps 'chasinglogic-files-map
   "f" 'counsel-find-file
   "b" 'counsel-bookmark
   "e" 'counsel-find-file
   "r" 'chasinglogic-rename-file-and-buffer
   "R" 'chasinglogic-reload-config
   "s" 'save-buffer
   "d" 'chasinglogic-find-dotfile
   "D" 'chasinglogic-delete-current-buffer-file)

  (defvar chasinglogic-buffers-map (make-keymap))
  (general-define-key
   :keymaps 'chasinglogic-buffers-map
   "b" 'switch-to-buffer
   "m" 'buffer-menu
   "s" 'chasinglogic-switch-to-scratch-buffer
   "D" 'kill-buffer
   "d" 'kill-current-buffer)

  (defvar chasinglogic-jump-map (make-keymap))
  (general-define-key
   :keymaps 'chasinglogic-jump-map
   "=" 'chasinglogic-indent-buffer
   "i" 'counsel-imenu
   "p" 'evil-jump-backward
   "n" 'evil-jump-forward)

  (defvar chasinglogic-misc-map (make-keymap))
  (general-define-key
   :keymaps 'chasinglogic-misc-map
   "w" 'writeroom-mode
   "b" 'switch-to-buffer
   "y" 'counsel-yank-pop)


  (defvar chasinglogic-quit-map (make-keymap))
  (general-define-key
   :keymaps 'chasinglogic-quit-map
   "q" 'save-buffers-kill-terminal
   "f" 'delete-frame)

  (defvar chasinglogic-git-map (make-keymap))
  (general-define-key
   :keymaps 'chasinglogic-git-map
   "b" 'magit-blame
   "a" 'magit-stage-file
   "c" 'magit-commit
   "s" 'magit-status)

  ;; Package keybind changes
  (general-define-key
   :keymaps 'evil-window-map
   "f" 'make-frame
   "o" 'ivy-get-a-frame
   "m" 'delete-other-windows
   "d" 'evil-window-delete)

  (general-define-key
   :keymaps 'projectile-command-map
   "g" 'counsel-projectile-grep
   "s" 'counsel-projectile-ag)

  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "M-p") 'counsel-projectile-find-file)
  (global-set-key (kbd "M-k") 'switch-to-buffer)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

  (general-override-mode)

  ;; leader keybindings
  (general-create-definer vim-leader-def :prefix "SPC")
  (vim-leader-def
   :states '(normal)
   :keymaps 'override
   "SPC" 'counsel-M-x
   "'"   '(chasinglogic-shell :which-key "run terminal")
   "x"   '(chasinglogic-shell :which-key "run terminal")
   "`"   '(shell-pop :which-key "shell popup")
   "TAB" '(chasinglogic-select-last-frame :which-key "select last frame")
   "m"   '(chasinglogic-projectile-make-command :which-key "make")
   "d"   'switch-to-buffer
   "w"   '(:keymap evil-window-map :which-key "windows")
   "p"   '(:keymap projectile-command-map :which-key "projectile")
   "q"   '(:keymap chasinglogic-quit-map :which-key "quit")
   "g"   '(:keymap chasinglogic-git-map :which-key "git")
   "r"   '(:keymap chasinglogic-misc-map :which-key "misc")
   ;; "e"   '(:keymap chasinglogic-errors-map :which-key "errors")
   "j"   '(:keymap chasinglogic-jump-map :which-key "jump")
   "b"   '(:keymap chasinglogic-buffers-map :which-key "buffers")
   "f"   '(:keymap chasinglogic-files-map :which-key "files"))

  ;; global keybindings
  (global-set-key (kbd "M-t") 'imenu)

  (general-evil-setup)
  (general-nmap "K" 'org-previous-visible-heading)
  (general-nmap "J" 'org-next-visible-heading)
  (general-nmap "-" 'chasinglogic-dired-current-file)
  (general-nmap "TAB" 'evil-indent-line))


(provide 'chasinglogic-keybinds)

;;; chasinglogic-keybinds.el ends here
