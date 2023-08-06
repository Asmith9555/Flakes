{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pastel    
    imagemagick
    catimg
  ];
  imports = [
    ./tealdeer
    ./atuin
    ./zoxide
  ];
}
