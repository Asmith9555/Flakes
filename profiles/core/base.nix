{
  pkgs,
  lib,
  inputs,
  ...
}: {

  environment.defaultPackages = with pkgs; [
    vim
    less
    uutils-coreutils
    keepassxc
  ];

  hardware.enableAllFirmware = true;

  time.timeZone = "America/Chicago";

  nix = {
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      sandbox = true;
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      keep-outputs = true;
      keep-derivations = true;
      fallback = true;
      warn-dirty = false;
    };
  };

  services = {
    openssh = {
      enable = true;
      openFirewall = false;
    };
  };
  
  i18n.inputMethod = {
    enabled = "fcitx5";
    # fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons fcitx5-table-extra fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki ];
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo = {
      enable = true;
      extraConfig = ''
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
