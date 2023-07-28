{ config, pkgs, lib, inputs, user, ... }:

{
  home = {
    packages = with pkgs [
      gradience
      adw-gtk3
      rose-pine-gtk-theme
      rose-pine-icon-theme
    ];
  };
  font = {
    name = "JetBrainsMono Nerd Font";
    size = 12;
  };
  gtk3.extraConfig = {
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-xft-hintstyle = "hintslight";
    gtk-xft-rgba = "rgb";
  };
  gtk2.extraConfig = ''
    gtk-xft-antialias=1
    gtk-xft-hinting=1
    gtk-xft-hintstyle="hintslight"
    gtk-xft-rgba="rgb"
  '';
}
