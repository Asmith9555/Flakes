{ config, ... }:

{
  home-manager.users."${config.vars.username}" = {
    home = {
      username = "${config.vars.username}";
      homeDirectory = "${config.vars.home}";
      stateVersion = config.system.stateVersion;
    };
    programs = {
      home-manager.enable = true;
    };
  };
}