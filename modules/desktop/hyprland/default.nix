{ config, lib, pkgs, inputs, stylix, ... }:
{
  imports = [ ../../programs/wayland/waybar/hyprland_waybar.nix ];
  programs = {
    dconf.enable = true;
    light.enable = true;
  };

  stylix = {
    image = ../../programs/common/wall/default.png;
  };

  environment.systemPackages = with pkgs; [
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    swaylock-effects
    pamixer
  ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
