{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pastel    
  ];
  imports = [
    ./tealdeer
    ./atuin
    ./zoxide
  ];
}
