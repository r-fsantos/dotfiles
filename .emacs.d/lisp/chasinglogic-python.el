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

(add-to-list 'auto-mode-alist '("SCons.*" . python-mode))

(provide 'chasinglogic-python)

;;; chasinglogic-python.el ends here
