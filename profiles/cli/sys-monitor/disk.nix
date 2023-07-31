{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    dua
    du-dust
  ];
}