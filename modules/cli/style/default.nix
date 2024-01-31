{ pkgs, ... }:
{
  imports = [
    ./bat
  ];
  home.packages = with pkgs; [
    eza
    figlet
    zscroll
    cbonsai
  ];
}
