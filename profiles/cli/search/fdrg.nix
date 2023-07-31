{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    fd
    ripgrep
  ];
}