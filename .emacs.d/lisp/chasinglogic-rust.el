;;; chasinglogic-rust.el --- rust language configuration

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

(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)
  :config
  (setq-default rust-format-on-save t)
  (unless (getenv "RUST_SRC_PATH")
    (exec-path-from-shell-copy-env "RUST_SRC_PATH")))

(use-package racer
  :diminish racer-mode
  :after rust-mode
  :config
  (setq-default racer-cmd (executable-find "racer"))
  (setq-default racer-rust-src-path (getenv "RUST_SRC_PATH"))
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(use-package cargo
  :diminish cargo-minor-mode
  :after rust-mode
  :config (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package company-racer
  :after company-mode
  :config (add-to-list 'company-backends 'company-racer))

(provide 'chasinglogic-rust)

;;; chasinglogic-rust.el ends here
