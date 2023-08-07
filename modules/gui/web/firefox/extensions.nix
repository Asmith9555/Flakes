{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs.firefox-addons.lib.${pkgs.system}) buildFirefoxXpiAddon;
  addons = inputs.firefox-addons.packages.${pkgs.system};
in {
  # NOTE: Most extensions are currently being configured imperatively.
  programs.firefox.profiles.default.extensions = with addons; [
    ublock-origin
    darkreader
    octotree
    gruvbox-dark-theme
    return-youtube-dislikes
  ];
}