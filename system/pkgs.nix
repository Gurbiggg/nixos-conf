{ config, pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        distrobox
        fastfetch
        git
        neovim 
        python3
        tlp
        wget
        zsh
    ];
}