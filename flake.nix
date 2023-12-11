{
  description = "NixOS Config Flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
  let
    # Options: gnome, plasma
    desktop = "gnome";
    
    # NixOS generation backups
    nixosGens = 10;
    username = "gurbiggg";
    name = "Gehrig Dixon";
    timezone = "America/Phoenix";
    locale = "en_US.UTF-8";
    nvidia = false;
    virtualization = true;

  in {
    nixosConfigurations = {
    # On first rebuild you need to specify which 
    # system to build, it should look like:
    # $ sudo nixos-rebuild switch --flake FLAKE-URI#HOSTNAME
    # You MUST include the hash in this command or it will not work
      framework = nixpkgs.lib.nixosSystem{
        system = "x86_64-linux";
        modules = [ 
          ./system/configuration.nix 
        ];
        specialArgs = {
          hostname = "framework";
          inherit username;
          inherit name;
          inherit timezone;
          inherit locale;
          inherit desktop;
          inherit nixosGens;
          inherit virtualization;
        };
      };

      legion = nixpkgs.lib.nixosSystem{
        system = "x86_64-linux";
        modules = [
          ./system/configuration.nix
          # ./system/nvidia.nix
          # ./user/games.nix
        ];
        specialArgs = {
          hostname = "legion";
          inherit username;
          inherit name;
          inherit timezone;
          inherit locale;
          # inherit desktop;
          inherit nixosGens;
          inherit virtualization;
          desktop = "plasma";
        };
      };
    };
  };
}
