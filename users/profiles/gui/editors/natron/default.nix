{ pkgs, ... }:
{
  home.packages = with pkgs; [
    natron
  ];
}