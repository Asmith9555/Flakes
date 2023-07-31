{ config, ... }:
{
  home-manager.users."${config.vars.username}" = {
    programs = {
      git = {
        enable = true;
        userName = "Wuger";
        userEmail = "wuger@wugerworks.com";
        delta = {
          enable = true;
        };
      };
      gh.settings.git_protocol = "ssh";
    };
  };
}
