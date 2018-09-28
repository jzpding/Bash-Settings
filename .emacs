;; Default monokai theme!
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'monokai t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2925ed246fb757da0e8784ecf03b9523bccd8b7996464e587b081037e0e98001" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'c-mode-hook
          (lambda () (add-to-list 'write-file-functions 'whitespace-cleanup)))

(setq-default tab-width 4
          c-basic-offset 4
          indent-tabs-mode nil)


(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if
  ;; neither, we use the current indent-tabs-mode
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

(infer-indentation-style)

;; column-marker -- highlight text when it crosses column 80
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'column-marker)
(add-hook 'c-mode-common-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'js-mode-hook (lambda() (interactive) (column-marker-1 80)))

;; GTAGS stuff
;; this should point to your GNU Global directory, where gtags.el is located
(setq load-path (cons "/home/jacding/gtags/global-6.6.2" load-path))
(autoload 'gtags-mode "gtags" "" t)

(setq c-mode-hook
      '(lambda ()
         (gtags-mode 1)
         ))


(setq c++-mode-hook
      '(lambda ()
         (gtags-mode 1)))

(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))

