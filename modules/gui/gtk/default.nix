{ pkgs, inputs, ... }:

{
  home = {
    sessionVariables = {
      GTK_THEME = "rose-pine";
    };
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors;
      name = "Catppuccin-Frappe-Rosewater";
      size = 16;
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Frappe-Rosewater";
    };
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
    font = {
      name = "Berkeley Mono";
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
  };
}