;;;; Company

(use-package company
  :diminish company-mode
  :commands (company-mode global-company-mode)
  :init
  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  (global-company-mode 1))

;;;; Ivy and Counsel

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

(use-package dash-at-point :diminish dash-at-point-mode :demand)

(provide 'chasinglogic-autocomplete)
