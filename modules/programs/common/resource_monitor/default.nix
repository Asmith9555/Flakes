{ config, pkgs, ... }:
{
  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "rose_pine_dawn";
      };
    };
  };
  home.file.".config/btop/themes/rose_pine_dawn.theme".source = ./themes/rose_pine_dawn_theme.nix;
}
