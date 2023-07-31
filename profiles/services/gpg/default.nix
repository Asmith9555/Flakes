{ config, pkgs, ... }:
{
  home-manager.users."${config.vars.username}" = {
    programs.gpg.package = pkgs.gnupg;
    services = {
      gpg-agent = {
        enable = true;
        pinentryFlavor = "gnome3";
      };
    };
  };
}
