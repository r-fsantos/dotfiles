;;; chasinglogic-evil.el --- My evil configuration

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

;; sets up evil and supplementary packages

;;; Code:

(use-package evil
  :demand
  :diminish evil-mode
  :init
  ;; evil-collection assumes evil-want-integration is set to nil before
  ;; loading evil and evil-collection.
  ;; See https://github.com/emacs-evil/evil-collection/issues/60 for
  ;; more details.
  (setq evil-want-keybinding nil
        evil-want-integration nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :diminish evil-collection-mode
  :after evil
  :config
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode 1))

(use-package evil-matchit
  :diminish evil-matchit-mode
  :after evil)

(use-package evil-magit
  :diminish evil-magit-mode
  :after evil)

(use-package evil-escape
  :diminish evil-escape-mode
  :commands (evil-escape-mode)
  :after evil
  :init
  (evil-escape-mode 1))

(use-package evil-surround
  :diminish evil-surround-mode
  :after evil
  :config
  (global-evil-surround-mode 1))

(provide 'chasinglogic-evil)

;;; chasinglogic-evil.el ends here
