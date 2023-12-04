{ config, pkgs, username, name, ... }:
{
    imports = [
        ./pkgs.nix
    ];
    users.users.${username} = {
      isNormalUser = true;
      description = name;
      extraGroups = [ "networkmanager" "wheel" ];
  };
}