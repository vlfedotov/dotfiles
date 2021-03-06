(package-initialize)

(setq-default frame-title-format '("%f"))

(add-to-list 'load-path "~/projects/org-mode/lisp")

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'default-frame-alist '(font . "Source Code Pro 10"))
(add-to-list 'default-frame-alist '(font . "Hack 10" ))
(add-to-list 'default-frame-alist '(font . "Inconsolata 10" ))

(set-face-attribute 'default t :font "Inconsolata 16" )
;;(set-face-attribute 'default t :font "Source Code Pro 10" )
;;(set-face-attribute 'default t :font "Hack 10" )

;;(ac-config-default)

;;keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)
;;scroll window up/down by one linei
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm

(require 'helm-config)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h") 'helm-projectile)

(require 'helm-swoop)
(global-set-key (kbd "M-]") 'helm-swoop)
(global-set-key (kbd "M-[") 'helm-swoop-back-to-last-point)
(define-key isearch-mode-map (kbd "M-]") 'helm-swoop-from-isearch)


(projectile-global-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROGRAMMING



(when (window-system)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(line-number-mode 1)

(require 'powerline)
(powerline-default-theme)

(add-hook 'ecb-mode-hook 'ecb-restore-window-sizes)
(defun ecb-activated-in-selected-frame ()
    "A hack to use ECB in multiple frames. It first deactivates ECB, then
    activate it in current frame."
    (interactive)
    (let ((current-frame (selected-frame)))
        ; The frame foucs change when activating or deactivating ECB is weird, so
        ; activate current selected frame explicitly.
        (if (and (boundp 'ecb-minor-mode) (ecb-minor-mode))
            (ecb-deactivate)
        )
        (select-frame current-frame)
        (ecb-activate)
        )
    )

;; Относительные номера строк
(require 'linum-relative)
(global-linum-mode t)
(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")

(setq whitespace-style '(face tabs))
; (setq whitespace-style '(face tabs lines-tail trailing))
(global-whitespace-mode t)

;;(require 'pomodoro)
;;(pomodoro-add-to-mode-line)

;;(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)

;; Переходы между окнами по Shift-стрелки
(windmove-default-keybindings)
;;(global-set-key (kbd "M-S-j")  'windmove-left)
;;(global-set-key (kbd "C-c <right>") 'windmove-right)
;;(global-set-key (kbd "C-c <up>")    'windmove-up)
;;(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-o") 'er/expand-region)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-c C-/") 'comment-region)
(global-set-key (kbd "C-c C-'") 'uncomment-region)

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

;;(global-flycheck-mode -1)

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
;;(setq-default dired-omit-files-p t)

;;(setq dired-omit-files
;;                (concat dired-omit-files "\\.pyc$"))
;;(setq dired-omit-files "\\|^\\..+$\\|\\.pdf$\\|\\.pyc$")
;;(define-key dired-mode-map (kbd "f") 'dired-find-alternate-file)
;;(define-key dired-mode-map (kbd "^") (lambda ()
;;                                       (interactive)
;;                                       (find-alternate-file "..")))

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
    ("a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(ecb-options-version "2.50")
 '(package-selected-packages
   (quote
    (helm-swoop dracula-theme better-defaults linum-relative powerline ace-jump-mode flx-ido expand-region color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)

(require 'dracula-theme)
(load-theme 'dracula t)
