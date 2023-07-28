{ config, pkgs, ... }:

{
  home = {
    file.".config/bat/themes/rose-pine.tmTheme" = ./rose-pine.tmTheme;
    packages = with pkgs; [
      fd
      ripgrep
    ];
  };
  programs = {
    fzf.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "Rosé Pine";
      };
    };
  };
}
