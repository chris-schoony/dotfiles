;;; -*- lexical-binding: t -*-

;; CUSTOM FILE
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;; SETTINGS
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(global-display-line-numbers-mode)

(setq package-enable-at-startup nil)
(setq inhibit-startup-message t)

(set-face-attribute 'default nil :font "Mononoki Nerd Font Mono" :height 185)

;; STRAIGHT.EL BOOTSTRAP AND CONFIG
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; PACKAGES
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-rose-pine-moon t))

(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-vcs-icon t)
  (setq doom-modeline-vcs-max-length 15)
  (setq doom-modeline-vcs-display-function #'doom-modeline-vcs-name)
  (setq doom-modeline-percent-position nil)
  (setq doom-modeline-position-line-format nil)
  (setq doom-modeline-buffer-encoding nil)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-indent-info nil))

(use-package magit
  :ensure t)

(use-package git-gutter-fringe
  :ensure t
  :config
  (setq-default fringes-outside-margins t)
  (define-fringe-bitmap 'git-gutter-fr:added [224]
    nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224]
    nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240]
    nil nil 'bottom)
  (with-eval-after-load 'magit
    (add-hook 'magit-post-refresh-hook #'git-gutter:update-all-windows)))

(use-package vterm
  :ensure t
  :config
  (add-hook 'vterm-mode-hook (lambda() (setq display-line-numbers nil))))

(use-package vterm-toggle
  :ensure t
  :config
  (global-set-key [f2] 'vterm-toggle)
  (define-key vterm-mode-map [f2] 'vterm-toggle)
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                (display-buffer-reuse-window display-buffer-at-bottom)
                (reusable-frames . visible)
                (window-height . 0.5))))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode 1))

;; BUILT IN PACKAGES CONFIG
(use-package savehist
  :ensure nil
  :config
  (savehist-mode 1))

(use-package delsel
  :ensure nil
  :config
  (delete-selection-mode 1))
