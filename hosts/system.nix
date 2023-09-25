{ pkgs, inputs, ... }:

{
  nixpkgs.system = "x86_64-linux";

  networking = {
    hostName = "thinkpad"; # Define your hostname.
    networkmanager.enable = true;
  };
  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
  services = {
    openssh = {
      enable = true;
    };
  };
  environment = {
    binsh = "${pkgs.bash}/bin/bash";
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      keepassxc
      sutils
      gcc
    ];
  };
  services.dbus.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = ["@wheel"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;

  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "23.05";
  };
}
