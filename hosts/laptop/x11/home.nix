{ config, lib, pkgs, user, impermanence, ... }:

{
  imports =
    [ (import ../../../modules/desktop/x11/bspwm/home.nix) ] ++
    [ (import ../../../modules/cli) ] ++
    (import ../../../modules/gpu) ++
    (import ../../../modules/desktop/x11);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.05";
}
