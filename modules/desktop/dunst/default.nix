{ pkgs, ... }:
{
  programs.dunst = {
    enable = true;
    configFile = ./dunstrc;
    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine";
    };
  };
}