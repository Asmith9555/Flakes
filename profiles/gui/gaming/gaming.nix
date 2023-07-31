{ pkgs, ... }:

{
  environment.defaultPackages = with pkgs; [ lutris ];
  programs.steam.enable = true;
}