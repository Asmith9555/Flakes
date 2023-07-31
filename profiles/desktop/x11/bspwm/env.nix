{ config, pkgs, ... }:

{
  home-manager.users."${config.vars.username}" = {
    home = {
      sessionVariables = {
        GLFW_IM_MODULE = "ibus";
        QT_QPA_PLATFORMTHEME = "gtk3";
        XDG_CACHE_HOME = "\${HOME}/.cache";
        XDG_CONFIG_HOME = "\${HOME}/.config";
        XDG_BIN_HOME = "\${HOME}/.local/bin";
        XDG_DATA_HOME = "\${HOME}/.local/share";
      };
      sessionPath = [
        "$HOME/.local/bin"
      ];
    };
  };
}
