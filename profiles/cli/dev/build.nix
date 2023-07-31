{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    just
  ];
}