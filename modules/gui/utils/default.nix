{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden
    nextcloud-client
  ];
}
