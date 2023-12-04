{ config, pkgs, ... }:
{
    services.xserver = {
        enable = true;
        layout = "us";
        xkbVariant = "";
        # libinput.enable = true;
        excludePackages = [ pkgs.xterm ];
    };
}