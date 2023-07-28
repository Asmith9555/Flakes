{ config, pkgs, lib, user, ... }:
{
  # home-manager.users.${user} = {
  #   services.polybar = {
  #     enable = true;
  #     package = pkgs.polybar.override {
  #       alsaSupport = true;
  #       pulseSupport = true;
  #       mpdSupport = true;
  #     };
  #     script = "sleep 2s;polybar -q main &";
  #   };
  # };{ config, pkgs, lib, ... }:

  home.file = {
    ".config/polybar" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink ./polybar;
    };
  };
  environment.systemPackages = with pkgs; [
    polybarFull
  ];

}
