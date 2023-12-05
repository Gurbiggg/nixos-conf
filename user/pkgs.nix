{ config, pkgs, username, ... }:
{
  users.users.${username}.packages = (with pkgs; [
    arduino
    bottles
    discord
    firefox
    godot_4
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
  ]) ++ (with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
    ms-python.python
    vscodevim.vim
  ]);
}