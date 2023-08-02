{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pixeluvo
  ];
}