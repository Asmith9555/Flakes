{ config, pkgs, theme, ... }:

{
  home.file = {
    ".config/kitty/themes".source = ./themes;
  };
  programs = {
    kitty = {
      enable = true;
      font.name = "Berkeley Mono";
      font.size = 14;
      settings = {
        italic_font = "auto";
        window_padding_width = 4;
        bold_italic_font = "auto";
        mouse_hide_wait = 2;
        cursor_shape = "block";
        url_color = "#eb6f92";
        url_style = "dotted";
        #Close the terminal =  without confirmation;
        confirm_os_window_close = 0;
        background_opacity = "0.80";
        include = "themes/${theme}.conf";
      };
      environment = { };
      keybindings = { };
    };
  };
}
