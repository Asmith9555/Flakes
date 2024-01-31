{
  pkgs,
  inputs,
  ...
}: let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in {
  # NOTE: Most extensions are currently being configured imperatively.
  programs.firefox.profiles.default.extensions = with addons; [
    octotree
    adnauseam
    bitwarden
    simplelogin
    tree-style-tab
    firefox-color
    to-deepl
  ];
}
