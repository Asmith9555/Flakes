{
  config,
  pkgs,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      layout = "us";
      displayManager = {
        defaultSession = "none+awesome";
        sddm.enable = true;
      };
      windowManager.awesome.enable = true;
      desktopManager.gnome.enable = false;
      libinput = {
        enable = true;
        touchpad = {
          middleEmulation = true;
          tapping = true;
          naturalScrolling = false;
        };
      };
    };
  };
  programs = {
    dconf.enable = true;
    light.enable = true;
  };
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };
  environment.systemPackages = with pkgs; [
    pamixer
    wmctrl
    slop
    xorg.xorgserver
    xorg.xf86inputsynaptics
    xorg.xf86inputevdev
    xorg.xf86inputlibinput
    xorg.xf86videointel
    xorg.xf86videoati
    xorg.xf86videonouveau
    xclip
    maim
    brightnessctl
    simplescreenrecorder
    libnotify
    pulseaudio
    inotify-tools
    xdg-utils
    i3lock-fancy
    wayland
    feh
    xdg-desktop-portal
  ];
}
