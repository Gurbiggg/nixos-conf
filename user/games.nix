{ config, pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs;[
    retroarch
    minecraft
    ryujinx
    dolphin-emu
    cemu
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  hardware.opengl.driSupport32Bit = true;
}