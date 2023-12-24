{ config, pkgs, username, ... }:
{
  users.users.${username}.packages = (with pkgs; [
  ]) ++ (with pkgs.vscode-extensions; [
    ms-python.python
    vscodevim.vim
  ]);
}