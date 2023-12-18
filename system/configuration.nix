# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, username, name, timezone, locale, desktop, nixosGens, hostname, virtualization, configPath, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      (../hosts + "/${hostname}" + /hardware-configuration.nix)
      ./pipewire.nix
      ./pkgs.nix
      ../user/user.nix
      (./de + "/${desktop}.nix")
    ];
  
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  
  # fix for vscode? exports wayland variables so vscode can use it
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Set NixOS config path
  #  nix.nixPath = [ "nixos-config=${configPath}" ];
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Setup garbage collection to run automatically
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.optimise.automatic = true;

  # Set hostname, determined by flake configuration
  networking.hostName = hostname;

  # Enable networking
  networking.networkmanager.enable = true;
  
  # Set time/locale
  time.timeZone = timezone;
  i18n.defaultLocale = locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
#    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
#    LC_TIME = locale;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = nixosGens;
  

  # Enable the OpenSSH daemon.  
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
