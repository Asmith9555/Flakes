{ pkgs, ... }:
{
  imports = [
    ./bat
  ];
  home.packages = with pkgs; [
    exa
  ];
}
