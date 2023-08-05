{ pkgs, ... }:
{
  programs.home = with pkgs; [
    fortune
  ];
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ./config;
  };
}