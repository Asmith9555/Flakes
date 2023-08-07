{
  home.file.".config/alacritty/themes".source = ./themes;
  programs.alacritty = {
    enable = true;
    settings = {
      import = ["~/.config/alacritty/rose-pine.toml"];
      window = {
        # decorations_theme_variant = "None";
        decorations = "none";
        opacity= 0.0;
      };
      font = {
        normal.family = "Berkeley Mono";
        size = 12;
      };
      draw_bold_text_with_bright_colors = true;
    };
  };
}