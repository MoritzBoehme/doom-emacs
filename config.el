(setq user-full-name "Moritz Böhme"
      user-mail-address "mail@moritzboeh.me")

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 14) )

(setq doom-theme 'doom-dracula)

(setq org-directory "~/Documents/org")

(setq org-roam-directory "~/Documents/org-roam")
(after! org-roam
  :custom
  (setq org-roam-capture-templates
        '(
          ("d" "default" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("s" "semester" plain (file "~/Documents/org-roam/templates/semester-template.org")
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("m" "modul" plain (file "~/Documents/org-roam/templates/modul-template.org")
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("D" "dozent" plain (file "~/Documents/org-roam/templates/dozent-template.org")
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("k" "kapitel" plain (file "~/Documents/org-roam/templates/kapitel-template.org")
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          )
        )
  )

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(setq display-line-numbers-type 'relative)

(with-eval-after-load "ispell"
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "de_DE,en_GB,en_US")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "de_DE,en_GB,en_US")
  ;; For saving words to the personal dictionary, don't infer it from
  ;; the locale, otherwise it would save to ~/.hunspell_de_DE.
  (setq ispell-personal-dictionary "~/.config/doom/.dictionary.txt"))

(unless (file-exists-p ispell-personal-dictionary)
  (write-region "" nil ispell-personal-dictionary nil 0))

(map! :n "g s s" 'evil-avy-goto-char-timer)

(map! :leader
      :desc "Zen mode (fullscreen)"
      "t z" '+zen/toggle-fullscreen
      "t Z" nil)

(with-eval-after-load "org-tree-slide"
  (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
  (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree)
  )
