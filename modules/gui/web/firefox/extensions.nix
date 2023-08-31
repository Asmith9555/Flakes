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
    keepassxc-browser
    simplelogin
    firefox-color
    sidebery
    to-deepl
    wappalyzer
    return-youtube-dislikes
  ];
}