(require 'package)
(add-to-list 'package-archives
    '("melpa" . "https://melpa.org/packages/")
)
(package-initialize)
(package-refresh-contents)

;; evil-mode
(unless (package-installed-p 'evil)
    (package-install 'evil)
)
(require 'evil)
(evil-mode 1)

;; lsp-mode
(unless (package-installed-p 'lsp-mode)
    (package-install 'lsp-mode)
)
(require 'lsp-mode)

