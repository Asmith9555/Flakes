{ pkgs, ... }:
{
  home.packages = with pkgs; [
    opentoonz
  ];
}