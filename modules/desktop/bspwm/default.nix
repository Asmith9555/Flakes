{ config, lib, pkgs, user, ... }:
{
  imports = [ ../../programs/x11/polybar ];
  services.xserver = {
    enable = true;
    displayManager = {
      startx.enable = true;
    };
    libinput = {
      enable = true;
      touchpad = {
        middleEmulation = true;
        tapping = true;
        naturalScrolling = false;
      };
    };
  };
  programs = {
    dconf.enable = true;
    light.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pamixer
    i3lock-fancy
  ];
}
