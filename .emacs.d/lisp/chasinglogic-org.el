;;; chasinglogic-org.el --- org mode configuration

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

(use-package org
  :ensure t
  ;; ignore org-mode from upstream and use a manually installed version
  :pin manual
  :config
  (setq org-fontify-whole-heading-line t
        org-src-fontify-natively t))

(use-package org-bullets
  :after org
  :diminish org-bullets-mode
  :config
  (org-bullets-mode))

(provide 'chasinglogic-org)

;;; chasinglogic-org.el ends here
