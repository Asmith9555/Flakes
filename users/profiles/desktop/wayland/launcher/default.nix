{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      rofi-wayland
    ];
    file.".config/rofi".source = ./rofi;
  };
}
