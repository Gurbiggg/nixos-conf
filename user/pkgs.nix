{ config, pkgs, username, ... }:
{
  users.users.${username}.packages = (with pkgs; [
    arduino
    bottles
    discord
    firefox
    godot_4
    gparted
    inkscape
    kicad
    krita
    musescore
    obs-studio
    obsidian
    prusa-slicer
    slack
    virt-manager
    vlc
    vscode
    vscode-extensions.jnoortheen.nix-ide
  ]) ++ (with pkgs.vscode-extensions; [
    ms-python.python
    vscodevim.vim
  ]);
}