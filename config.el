;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "linlin.zhao"
      user-mail-address "linlin_zhao@yeah.net")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; doom-one/zaiste/
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-agenda-files
      (list
       (concat org-directory "~/SynologyDrive/note/")
       (concat org-directory "~/SynologyDrive/roam/")
       ))
(setq +org-capture-journal-file "~/SynologyDrive/note/journal/journal.org")
(setq +org-capture-todo-file "~/SynologyDrive/note/journal/tasks.org")
(setq +org-capture-notes-file "~/SynologyDrive/note/journal/inbox.org")
(setq +org-capture-projects-file "~/SynologyDrive/note/journal/projects.org")

(setq org-journal-dir "~/SynologyDrive/note/journal/")
(setq
 org-ellipsis " ▾ "
 org-log-done 'time
 css-indent-offset 2)



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
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;;
;;设置 emacs 代理
(setq url-proxy-srvices
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" . "127.0.0.1:7890")
	("https" . "127.0.0.1:7890")))

;; 设置补全的延迟时间
(setq company-idle-delay 0)

;; font for orgmode table
(setq fonts
      (cond ((eq system-type 'darwin)     '("Monaco"    "STHeiti"))
            ((eq system-type 'gnu/linux)  '("Menlo"     "WenQuanYi Zen Hei"))
            ((eq system-type 'windows-nt) '("Consolas"  "Microsoft Yahei"))))
(set-face-attribute 'default nil :font
                    (format "%s:pixelsize=%d" (car fonts) 14))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
                    (font-spec :family (car (cdr fonts)))))
;; Fix chinese font width and rescale
(setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Micro Hei Mono" . 1.2) ("STHeiti". 1.2)))

;; org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)



;; 代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))




;; VUE
(setq vue-mode-packages
      '(vue-mode))

(setq vue-mode-excluded-packages '())

(defun vue-mode/init-vue-mode ()
  "Initialize my package"
  (use-package vue-mode))


;; 设置 projectile 的 search-path
(setq projectile-project-search-path '("~/SynologyDrive/" ("~/github" . 1)))




;;roam
(setq org-roam-directory "~/SynologyDrive/roam")
(setq org-roam-completion-everywhere t)

(setq tramp-default-method "ssh")


;; org mode 的主题设置
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;; key map
;; 设置org mode中 编辑src代码的快捷键
(global-set-key (kbd "C-c s e") 'org-edit-src-code)
;; 设置代码格式化快捷键
(global-set-key (kbd "C-c \\") 'indent-region-or-buffer)
