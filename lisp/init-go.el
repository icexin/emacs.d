(require-package 'go-mode)
(require-package 'go-autocomplete)

(after-load 'flycheck
  (require 'go-autocomplete))

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-b") 'pop-tag-mark)))

(setq gofmt-command "goimports")

;;; for go path
(require-package 'exec-path-from-shell)
(exec-path-from-shell-copy-env "GOPATH")

(provide 'init-go)
