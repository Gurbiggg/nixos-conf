{ config, pkgs, ...}:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages = epkgs: with epkgs; [
      timu-rouge-theme
      use-package
      org
      nix-mode
    ];
    extraConfig = ''
      (require 'package)
      (add-to-list  'package-archives
                    '("melpa" . "https://melpa.org/packages/"))
      (package-refresh-contents)

      (unless (package-installed-p 'use-package)
        (package-install 'use-package))
      
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
