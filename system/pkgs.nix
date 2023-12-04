{ config, pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        distrobox
        git
        python3
        tlp
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        zsh
    ];
}