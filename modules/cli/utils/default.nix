{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pastel    
    libguestfs
    imagemagick
    catimg
  ];
  imports = [
    ./tealdeer
    ./atuin
    ./zoxide
  ];
}
