{ config, pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs;[
    retroarch
    minecraft
  ]
}