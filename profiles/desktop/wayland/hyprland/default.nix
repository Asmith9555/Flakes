{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      nvidiaPatches = true;
    };
    dconf.enable = true;
    light.enable = true;
  };
  environment.systemPackages = with pkgs; [
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    swaylock-effects
    pamixer
  ];
  security.pam.services.swaylock = {};
  xdg.portal = {
    enable = true;
    # wlr.enable = true;
  };
}
