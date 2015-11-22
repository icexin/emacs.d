(require 'init-go)

(when (member "DejaVu Sans Mono" (font-family-list))
  (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-14"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-14")))

(when (and (eq system-type 'darwin) (display-graphic-p))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :family "PingFang SC"))))
   ;; (font-spec :family "Hiragino Sans GB")))

;;; for line spacing
(setq-default line-spacing 0.3)

;;; for markdown
(require-package 'markdown-toc)

;;; for visible-bell
(setq visible-bell nil)

;; for cpp
(require 'init-cpp)

(provide 'init-local)
