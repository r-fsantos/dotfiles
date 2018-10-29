;;; chasinglogic-projectile.el --- projectile configuration

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

(use-package projectile :demand
  :diminish projectile-mode
  :config
  (setq projectile-switch-project-action 'projectile-dired)
  (add-to-list 'projectile-globally-ignored-directories "vendor")
  (add-to-list 'projectile-globally-ignored-directories ".venv")
  (defun set-frame-name-to-project ()
    (set-frame-parameter (selected-frame) 'name (projectile-project-name)))
  (add-hook 'projectile-after-switch-project-hook 'set-frame-name-to-project))

(use-package counsel-projectile :demand
  :diminish counsel-projectile-mode
  :config
  (defun counsel-projectile-switch-project-action-dired (project)
    "Run dired at root of PROJECT."
      (let ((projectile-switch-project-action
	 (lambda ()
	   (projectile-dired))))
    (counsel-projectile-switch-project-by-name project)))

  (setq counsel-projectile-switch-project-action '(1
                                                   ("D" counsel-projectile-switch-project-action-dired "open project root in dired")
                                                   ("o" counsel-projectile-switch-project-action "jump to a project buffer or file")
                                                   ("f" counsel-projectile-switch-project-action-find-file "jump to a project file")
                                                   ("d" counsel-projectile-switch-project-action-find-dir "jump to a project directory")
                                                   ("b" counsel-projectile-switch-project-action-switch-to-buffer "jump to a project buffer")
                                                   ("m" counsel-projectile-switch-project-action-find-file-manually "find file manually from project root")
                                                   ("S" counsel-projectile-switch-project-action-save-all-buffers "save all project buffers")
                                                   ("k" counsel-projectile-switch-project-action-kill-buffers "kill all project buffers")
                                                   ("K" counsel-projectile-switch-project-action-remove-known-project "remove project from known projects")
                                                   ("c" counsel-projectile-switch-project-action-compile "run project compilation command")
                                                   ("C" counsel-projectile-switch-project-action-configure "run project configure command")
                                                   ("E" counsel-projectile-switch-project-action-edit-dir-locals "edit project dir-locals")
                                                   ("v" counsel-projectile-switch-project-action-vc "open project in vc-dir / magit / monky")
                                                   ("sg" counsel-projectile-switch-project-action-grep "search project with grep")
                                                   ("ss" counsel-projectile-switch-project-action-ag "search project with ag")
                                                   ("sr" counsel-projectile-switch-project-action-rg "search project with rg")
                                                   ("xs" counsel-projectile-switch-project-action-run-shell "invoke shell from project root")
                                                   ("xe" counsel-projectile-switch-project-action-run-eshell "invoke eshell from project root")
                                                   ("xt" counsel-projectile-switch-project-action-run-term "invoke term from project root")
                                                   ("O" counsel-projectile-switch-project-action-org-capture "org-capture into project")))
  (counsel-projectile-mode))

(provide 'chasinglogic-projectile)

;;; chasinglogic-projectile.el ends here
