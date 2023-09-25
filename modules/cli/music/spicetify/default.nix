{ inputs, pkgs, config, ...}:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
        playlistIcons
        inputs.spicetify-nix.packages.${pkgs.system}.default.extensions.adblock
        genre
        historyShortcut
        hidePodcasts
        fullAppDisplay
        shuffle
      ];
  };
}