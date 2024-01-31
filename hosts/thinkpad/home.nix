{
  imports =
    [ (import ../../modules/desktop/hyprland/home.nix) ] ++
    (import ../../modules/gui) ++
    (import ../../modules/cli) ++
    (import ../../modules/desktop);

  home = {
    username = "wuger";
    homeDirectory = "/home/wuger";
    stateVersion = "23.11";
  };
  programs = {
    home-manager.enable = true;
  };
}
