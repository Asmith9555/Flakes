{
  programs = {
    mpv = {
      enable = true;
    };
  };
  home = {
    file.".config/mpv/mpv.conf".source = ./mpv.conf;
    file.".config/mpv/scripts/file-browser.lua".source = ./scripts/file-browser.lua;
  };
}
