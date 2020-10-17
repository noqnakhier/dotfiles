;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "noqnakhier"
      user-mail-address "noqnakhier@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;;(setq doom-font (font-spec :family "Monaco" :size 14 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "PingFang SC" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; cnfonts config
(when (display-graphic-p)
  (progn
    (set-face-attribute
     'default nil
     :font (font-spec :name "-*-Noto Mono for Powerline-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                      :weight 'normal
                      :slant 'normal
                      :size 15))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font
       (frame-parameter nil 'font)
       charset
       (font-spec :name "-*-Hiragino Sans GB-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 18)))

    )
  )

;; Org mode settings
(use-package! org
  :config
  (setq org-startup-indented nil)
  ;; 设置TODO的状态数量
  (setq org-todo-keywords
     '((sequence "TODO" "HAND" "|" "DONE")
       (sequence "|" "CANCELED")))
  ;; 将代码块根据对应的语言进行高亮
  (setq org-src-fontify-natively t)
  ;; 设置状态的颜色样式
  (setf org-todo-keyword-faces '(("TODO" (:foreground "white" :background "red"))
                               ("HAND" (:foreground "white" :background "green"))
                               ("DONE" (:foreground "white" :background "blue"))
                               ("CANCELED" (:foreground "white" :background "grey"))))
  (setq org-export-with-sub-superscripts (quote {}))
  (setq org-html-htmlize-output-type 'css)
  )



;;(add-hook! prog-mode 'global-company-mode)
(use-package! company
;;  :commands (company-mode global-company-mode company-complete
;;             company-complete-common company-manual-begin company-grab-line)
  :config
  (setq company-show-numbers nil
        company-minimum-prefix-length 0
        company-selection-wrap-around t
        company-idle-delay 0
        company-require-match nil
        company-etags-ignore-case t
        company-auto-commit t)
  (company-tng-configure-default))


;; Python lsp settings
(use-package! lsp-python-ms
  :defer t
  :demand
                                        ; :ensure nil
  :hook (python-mode . lsp)
  :config
  (setq lsp-python-ms-dir
        (expand-file-name "~/Dev/python-language-server/output/bin/Release"))
  (setq lsp-python-ms-executable
        "~/Dev/python-language-server/output/bin/Release/osx-x64/publish/Microsoft.Python.LanguageServer"))

;; rust lang
(add-hook 'before-save-hook (lambda () (when (eq 'rust-mode major-mode)
                                           (lsp-format-buffer))))

(after! prog-mode
  (set-company-backend! 'company-yasnippet))
