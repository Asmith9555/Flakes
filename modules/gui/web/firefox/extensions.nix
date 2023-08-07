{
  pkgs,
  inputs,
  ...
}: let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in {
  # NOTE: Most extensions are currently being configured imperatively.
  programs.firefox.profiles.default.extensions = with addons; [
    darkreader
    octotree
    adnauseam
    keepassxc-browser
    old-reddit-redirect
    firefox-color
    single-file
    sidebery
    tetrio-plus
    to-deepl
    wappalyzer
    text-contrast-for-dark-themes
    auto-tab-discard
    return-youtube-dislikes
  ];
}