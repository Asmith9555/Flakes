{ config, ... }:
{
  home-manager.users."${config.vars.username}".programs.bat = {
    enable = true;
    config = { theme = "GitHub"; pager = "less"; };
  };
}