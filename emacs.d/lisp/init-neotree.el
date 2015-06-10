;; Neotree -- a Emacs tree plugin like NerdTree for vim
(require 'neotree)
(eval-after-load 'neotree
  '(progn
     (add-to-list 'load-path (directory-of-library "neotree"))
     (global-set-key [f8] 'neotree-toggle)
     ))

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB")
              'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC")
              'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q")
              'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET")
              'neotree-enter)
            ))

(provide 'init-neotree)
