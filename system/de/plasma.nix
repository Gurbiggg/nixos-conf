{ config, pkgs, ... }:
{
    imports = [
        ../x11.nix
    ];

    services.xserver = {
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true; 
    };
}