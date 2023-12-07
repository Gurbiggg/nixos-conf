{ config, pkgs, ... }:
{
    imports = [
        ../x11.nix
    ];
    services.xserver = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    environment.gnome.excludePackages = (with pkgs; [
        gnome-tour
    ]) ++ (with pkgs.gnome; [
        gedit
        gnome-music
        epiphany
        geary
        totem
        yelp
        file-roller
        iagno
        hitori
        atomix
    ]);

    environment.systemPackages = with pkgs; [
        blackbox-terminal
        gnome-extension-manager
        gnome.gnome-boxes
        gnome.dconf-editor
	    gnome.gnome-tweaks	
    ];
}
