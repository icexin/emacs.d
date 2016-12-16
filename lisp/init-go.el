(require-package 'go-mode)
(require-package 'company-go)
(require-package 'go-guru)

(require 'company)
(require 'company-go)
(require 'go-guru)

(after-load 'flycheck
  (require 'go-autocomplete))

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-b") 'pop-tag-mark)))

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(add-hook 'go-mode-hook (lambda ()
                          (setq tab-width 2)))

(setq gofmt-command "goimports")

;;; for go path
(require-package 'exec-path-from-shell)
(exec-path-from-shell-copy-env "GOPATH")

(provide 'init-go)
