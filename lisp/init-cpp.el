;;; for flycheck

(require 'flycheck)

(flycheck-define-checker c/c++-linux-gcc
  "A C/C++ syntax checker using linux GCC.

Requires ~/bin/linux-gcc."
  :command ("linux-gcc" source-inplace)
  :standard-input f
  :error-patterns
  ((error line-start
          (message "In file included from") " " (or "<stdin>" (file-name))
          ":" line ":" column ":" line-end)
   (info line-start (or "<stdin>" (file-name)) ":" line ":" column
         ": note: " (message) line-end)
   (warning line-start (or "<stdin>" (file-name)) ":" line ":" column
            ": warning: " (message) line-end)
   (error line-start (or "<stdin>" (file-name)) ":" line ":" column
          ": " (or "fatal error" "error") ": " (message) line-end))
  :error-filter
  (lambda (errors)
    (flycheck-fold-include-levels (flycheck-sanitize-errors errors)
                                  "In file included from"))
  :modes (c-mode c++-mode)
  :next-checkers ((warning . c/c++-cppcheck)))

(add-to-list 'flycheck-checkers 'c/c++-linux-gcc)

(provide 'init-cpp)
