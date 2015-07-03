(require 'init-go)

(when (member "DejaVu Sans Mono" (font-family-list))
  (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-14"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-14")))

(when (and (eq system-type 'darwin) (display-graphic-p))
  (set-fontset-font
     (frame-parameter nil 'font)
        'han
           (font-spec :family "Hiragino Sans GB")))

(provide 'init-local)
