(package-initialize)

(add-to-list 'load-path "~/projects/org-mode/lisp")

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'default-frame-alist '(font . "Source Code Pro 10"))
(add-to-list 'default-frame-alist '(font . "Hack 10" ))
(set-face-attribute 'default t :font "Source Code Pro 10" )
;;(set-face-attribute 'default t :font "Hack 10" )

(when (window-system)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(line-number-mode 1)

(require 'powerline)
(powerline-default-theme)

(global-linum-mode t)

(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")

(require 'pomodoro)
(pomodoro-add-to-mode-line)

(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)

(global-set-key (kbd "C-o") 'er/expand-region)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--colors=Linux --profile=default"
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code
      "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code
      "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code
      "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(defun select-current-line ()
  "Select the current line."
  (interactive)
  (end-of-line)
  (push-mark (line-beginning-position) nil t))

(defun insert-line ()
  (interactive)
  (end-of-line)
  (newline))
(global-set-key (kbd "C-c o") 'insert-line)

(projectile-global-mode)
(global-set-key (kbd "C-c h") 'helm-projectile)
(global-flycheck-mode -1)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;(require 'dired-details)
;(setq-default dired-details-hidden-string "---")
;(dired-details-install)

(setq dired-recursive-deletes (quote top))
(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))
(setq dired-omit-mode t)
;(setq-default dired-omit-files-p t)

					;(setq dired-omit-files
;                (concat dired-omit-files "\\.pyc$"))
;(setq dired-omit-files "\\|^\\..+$\\|\\.pdf$\\|\\.pyc$")
;(define-key dired-mode-map (kbd "f") 'dired-find-alternate-file)
;(define-key dired-mode-map (kbd "^") (lambda ()
;                                       (interactive)
;                                       (find-alternate-file "..")))

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "M-*") 'pop-tag-mark)

(global-visual-line-mode t)

(delete-selection-mode t)
(blink-cursor-mode t)
(show-paren-mode t)

(setq make-backup-file nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(package-selected-packages
   (quote
    (better-defaults linum-relative powerline ace-jump-mode flx-ido expand-region color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
