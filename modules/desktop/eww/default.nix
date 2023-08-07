{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fortune
    wirelesstools
  ];
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ./config;
  };
}