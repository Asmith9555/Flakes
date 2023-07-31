{ config, ... }:
{
  home-manager.users."${config.vars.username}".programs.bottom = {
    enable = true;
  };
}