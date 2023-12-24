{ config, pkgs, ...}:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: with epkgs; [
      use-package
      evil
    ];
    extraConfig = ''
      (require 'package)
      (add-to-list  'package-archives
                    '("melpa" . "https://melpa.org/packages/"))
      (package-initialize)
      (package-refresh-contents)

      (unless (package-installed-p 'use-package)
        (packages-refresh-contents)
        (package-install 'use-package))

      (unless (package-installed-p 'evil)
        (package-install 'evil))
      
      (require 'evil)
      (package-initialize)
      (evil-mode 1)

      (use-package timu-rouge-theme
        :ensure t
        :config
        (load-theme 'timu-rouge t ))
      
      (customize-set-variable 'timu-rouge-org-intense-colors t)
      (customize-set-variable 'timu-rouge-mode-line-border t)
      (setq standard-indent 2)
    '';
  };
}
