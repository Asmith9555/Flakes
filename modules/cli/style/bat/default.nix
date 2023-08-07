{
  home = {
    file.".config/bat/themes/rose-pine.tmTheme".source = ./rose-pine.tmTheme;
  };
  programs = {
    bat = {
      enable = true;
      config = {
        theme = "rose-pine";
      };
    };
  };
}
