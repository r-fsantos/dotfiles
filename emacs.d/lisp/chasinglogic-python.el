;;; chasinglogic-python.el --- python configuration

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

(setq-default python-shell-interpreter "python3"
              flycheck-python-pylint-executable "python3")

(when (eq system-type 'darwin) ;; mac specific settings
  (setq-default python-shell-interpreter "/usr/local/bin/python3"
                flycheck-python-pylint-executable "/usr/local/bin/python3"
                flycheck-python-pycompile-executable "/usr/local/bin/python3"))

(use-package py-isort
  :demand
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package py-yapf
  :demand
  :config
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save))

(use-package anaconda-mode
  :diminish anaconda-mode
  :commands (anaconda-mode anaconda-eldoc-mode pythonic-activate)
  :init
  (defun chasinglogic-python-mode-hook ()
    (anaconda-eldoc-mode 1)
    (anaconda-mode 1))
  (add-hook 'python-mode 'chasinglogc-python-mode-hook))

(use-package company-anaconda
  :after company
  :config
  (add-to-list 'company-backends 'company-anaconda))

(use-package pyenv-mode :demand
  :config (pyenv-mode))

(use-package auto-virtualenv
  :demand
  :config
  ;; Activate on changing buffers
  (add-hook 'window-configuration-change-hook 'auto-virtualenv-set-virtualenv)
  ;; Activate on focus in
  (add-hook 'focus-in-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv))

(provide 'chasinglogic-python)

;;; chasinglogic-python.el ends here
