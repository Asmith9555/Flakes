{ config, pkgs, ... }:
{
  home-manager.users."${config.vars.username}" = {
    home.file ".config/polybar".source =  ./polybar;
  };
  environment.systemPackages = with pkgs; [
    polybarFull
  ];
}
