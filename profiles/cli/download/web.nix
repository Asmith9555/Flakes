{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    curl
    wget2
  ];
}
