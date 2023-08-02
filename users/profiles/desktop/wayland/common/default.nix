{pkgs, ...}: {
  home.packages = with pkgs; [
    libnotify
    wl-clipboard
    wlr-randr
    cinnamon.nemo
    networkmanagerapplet
    wev
    wf-recorder
    alsa-lib
    alsa-utils
    flac
    pulsemixer
    imagemagick
    pkgs.sway-contrib.grimshot
    flameshot
    grim
  ];
  imports = [
    ./swww
    ./imgview
    ./kooha
    ./launcher
    ./notice
  ];
}
