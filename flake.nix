{
  description = "NixOS Config Flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  #  flatpaks.url = "github:GermanBread/declarative-flatpak/stable";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    # Options: gnome, plasma, hyprland (not yet working)
    desktop = "gnome";
    
    # NixOS generation backups
    nixosGens = 10;
    username = "gurbiggg";
    name = "Gehrig Dixon";
    timezone = "America/Phoenix";
    locale = "en_US.UTF-8";
    nvidia = false;
    virtualization = true;
    configPath = /home + "/${username}" + /nixos-conf;
    pkgs = import nixpkgs {
      system = "x86_64-linux"; 
      config = { 
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
    };

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
          inherit configPath;
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
          inherit nixosGens;
          # inherit virtualization;
          desktop = "plasma";
          inherit configPath;
        };
      };
    };

    homeConfigurations = {
      gurbiggg = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        #inherit username;
        modules = [
         # flatpaks.homeManagerModules.default
          ./user/home.nix
          
        ];
      };
    };
  };
}
