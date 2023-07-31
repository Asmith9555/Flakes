{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    curl
    wget2
    git
  ];
}
