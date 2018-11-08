;;; chasinglogic-utils.el --- my utility functions stolen or otherwise

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

;; from spacemacs-core
;; from magnars
(defun chasinglogic-delete-current-buffer-file ()
  "Remove file connected to current buffer and kill the related buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to delete this file? ")
        (delete-file filename t)
        (kill-buffer buffer)
        (when (and (configuration-layer/package-usedp 'projectile)
                   (projectile-project-p))
          (call-interactively #'projectile-invalidate-cache))
        (message "File '%s' successfully removed" filename)))))

(defun chasinglogic-indent-buffer ()
  "Indent the entire buffer."
  (interactive)
  (evil-indent (point-min) (point-max)))

(defun chasinglogic-find-dotfile ()
  "Find my init file."
  (interactive)
  (find-file (concat dotfiles-dir "init.el")))

(defun chasinglogic-dired-current-file ()
  "Dired the directory of the current file."
  (interactive)
  (if (eq major-mode 'dired-mode)
      (dired-up-directory)
    (dired (file-name-directory (buffer-file-name)))))

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun chasinglogic-rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun chasinglogic-add-projector-projects-to-projectile ()
  "Add projector projects to projectile."
  (interactive)
  (setq
   projectile-known-projects
   (delete ""
           (split-string
            (shell-command-to-string "projector list") "\n"))))

(defun chasinglogic-switch-to-scratch-buffer ()
  "Switch to scratch buffer quickly."
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun chasinglogic-reload-config ()
  "Reload my configuration file."
  (interactive)
  (load-file (concat (getenv "HOME") "/.emacs.d/init.el")))

(defun chasinglogic-projectile-make-command (&optional target sync)
  "Run a make command at the projectile project root.

If TARGET provided will run that make target.
If SYNC provided will run make command synchronously"
  (interactive "smake ")
  (let (
        (default-directory (projectile-project-root))
        (make-command (if target
                          (concat "make " target)
                        "make")))
    (shell-command
     (if sync
         make-command
       (concat make-command " &"))
     (format "*%s make output*" (projectile-project-name)))))

(defun chasinglogic-prq ()
  "Open a pull request on github."
  (interactive)
  (shell-command "hub pull-request -m \"$(git log -n 1 --format='%s')\" --browse"))

(provide 'chasinglogic-utils)

;;; chasinglogic-utils.el ends here
