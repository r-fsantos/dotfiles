;;; chasinglogic-go.el --- golang related configuration

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

(use-package company-go :demand
  :after company
  :config
  (add-to-list 'company-backends 'company-go))

(use-package go-eldoc
  :diminish go-eldoc-mode
  :commands (go-eldoc-setup))

(use-package gotest
  :commands (
             go-test-current-file
             go-test-current-test
             go-test-current-project
             go-test-current-coverage
             go-test-current-benchmark
             go-test-current-file-benchmarks
             go-test-current-project-benchmarks
             ))

(defun chasinglogic-go-mode-hook ()
  "Set important go specific environment variables."
  (setq-default tab-width 4)
  (setq-default gofmt-command "goimports")
  (exec-path-from-shell-copy-env "GOROOT")
  (exec-path-from-shell-copy-env "GOPATH")
  (set (make-local-variable 'company-backends) '(company-go))
  (go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'chasinglogic-go-mode-hook)

(defun go-mode-update-tools ()
  "Update the tools that go-mode needs to be awesome."
  (interactive)
  (message "updating go tools via go get")
  (mapcar
   (lambda (tool-url)
     (message "updating: %s" tool-url)
     (call-process-shell-command
      (format "go get -u %s" tool-url) nil "*go-get-output*" t))
   '("github.com/nsf/gocode"
     "github.com/alecthomas/gometalinter"
     "golang.org/x/tools/cmd/goimports"
     "github.com/rogpeppe/godef"
     "github.com/golang/lint"
     "github.com/kisielk/errcheck"
     "github.com/mdempsky/unconvert"
     "golang.org/x/tools/cmd/guru"
     "golang.org/x/tools/cmd/gorename")))

(provide 'chasinglogic-go)

;;; chasinglogic-go.el ends here
