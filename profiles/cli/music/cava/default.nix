{ config, pkgs, ... }:
{
  home-manager.users."${config.vars.username}" = {
    home = {
      file.".config/cava/config".source = ./config;
      file.".config/cava/config1".source = ./config1;
      packages = with pkgs; [
        cava
      ];
    };
  };
}
