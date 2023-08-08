{ pkgs, inputs,... }:
{
  programs = {
    dconf.enable = true;
    light.enable = true;
  };
  environment.systemPackages = with pkgs; [
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprsome.packages.${pkgs.system}.default
    cliphist
    slurp
    swaylock-effects
  ];
  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
