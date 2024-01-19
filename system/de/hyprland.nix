{ config, pkgs, ... }:
{
  (pkgs.hyprland.override {
    enableXWayland = true;
    legacyRenderer = true;
    withSystemd = true;
  });

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
