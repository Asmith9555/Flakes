{ pkgs, ... }:
{
  imports = [
    ./bat
  ];
  home.packages = with pkgs; [
    exa
    figlet
    zscroll
    cbonsai
  ];
}
