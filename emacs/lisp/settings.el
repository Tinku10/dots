;; Don't show startup splash screen
(setq inhibit-startup-message t)

;; Turn off visible bell
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; Turn off some unneeded UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure and load use-package
(setq use-package-always-ensure t)

(eval-when-compile
  (defvar use-package-verbose t)
  (require 'use-package))

(if (window-system)
  (set-frame-font "JetBrainsMono Nerd Font Mono:size=14" nil t))

(column-number-mode 1)
(line-number-mode 1)

(provide 'settings)
