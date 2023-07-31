{ config, ... }:
{
  home-manager.users."${config.vars.username}" = {
    programs = {
      ncmpcpp = {
        enable = true;
      };
    };
  };
} 