{ config, lib, pkgs, user, impermanence, ... }:

{
  imports =
    [ (import ../../../modules/desktop/wayland/hyprland/home.nix) ] ++
    (import ../../../modules/gui) ++
    (import ../../../modules/cli) ++
    (import ../../../modules/desktop/wayland);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.05";
}
