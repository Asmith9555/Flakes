{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      nvidiaPatches = true;
      xwayland.enable = true;
    };
    dconf.enable = true;
    light.enable = true;
  };
  services = {
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    dbus.enable = true;
  };
  environment = {
    sessionVariables = {
       QT_QPA_PLATFORMTHEME = "gtk3";
        QT_SCALE_FACTOR = "1";
        MOZ_ENABLE_WAYLAND = "1";
        SDL_VIDEODRIVER = "wayland";
        _JAVA_AWT_WM_NONREPARENTING = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        CLUTTER_BACKEND = "wayland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        WLR_NO_HARDWARE_CURSORS = "1";
        XDG_CACHE_HOME = "\${HOME}/.cache";
        XDG_CONFIG_HOME = "\${HOME}/.config";
        XDG_BIN_HOME = "\${HOME}/.local/bin";
        XDG_DATA_HOME = "\${HOME}/.local/share";
    };    
    systemPackages = with pkgs; [
      inputs.hypr-contrib.packages.${pkgs.system}.grimblast
      swaylock-effects
      pamixer
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
      mako
      pulsemixer
      imagemagick
      pkgs.sway-contrib.grimshot
      flameshot
      grim
    ];
  };
  security.pam.services.swaylock = {};
  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  # };
}
