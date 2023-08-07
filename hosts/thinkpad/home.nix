{
  imports =
    [ (import ../../modules/desktop/hyprland/home.nix) ] ++
    (import ../../modules/gui) ++
    (import ../../modules/cli) ++
    (import ../../modules/desktop);

  home = {
    username = "wuger";
    homeDirectory = "/home/wuger";
    stateVersion = "23.05";
  };
  programs = {
    home-manager.enable = true;
  };
}
