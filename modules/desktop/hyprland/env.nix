{ config, pkgs, ... }:

{
  xdg = {
    enable = true;
    cacheHome = /home/wuger/.cache;
    configHome =/home/wuger/.config;
    dataHome =/home/wuger/.local/share;
    mime.enable = true;
    mimeApps.enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      documents = /home/wuger/Documents;
      download = /home/wuger/Downloads;
      music = /home/wuger/Music;
      videos = /home/wuger/Videos;
      pictures = /home/wuger/Pictures;
    };
  };
  home = {
    sessionVariables = {
      EDITOR = "hx";
      TERMINAL = "kitty";
      SHELL = "fish";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_SCALE_FACTOR = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
}
