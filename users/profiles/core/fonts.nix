{pkgs, ...}: {
  home.packages = with pkgs; [
    twemoji-color-font
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
    twemoji-color-font
    berkeley-mono-font
  ];

  #  fontconfig = {
  #   defaultFonts = {
  #     serif = [ "Noto"]
  #   }
  # }
}
