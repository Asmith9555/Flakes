{ pkgs, lib, ... }:

{
  environment.defaultPackages = with pkgs; [
    vim
    less
    uutils-coreutils
  ];

  hardware.enableAllFirmware = true;

  nix = {
    package = pkgs.nixUnstable;
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      sandbox = true;
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
      keep-outputs = true;
      keep-derivations = true;
      fallback = true;
      warn-dirty = false;
    };
  };

  services.openssh = {
    enable = true;
    openFirewall = lib.mkDefault false;
  };

  security = {
    rtkit.enable = true;
    sudo = {
      enable = false;
      extraConfig = ''
        ${user} ALL=(ALL) NOPASSWD:ALL
        Defaults timestamp_timeout=300
      '';
    };
    doas = {
      enable = false;
      extraConfig = ''
        permit nopass :wheel
      '';
    };
  };
}