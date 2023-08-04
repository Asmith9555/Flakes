{
  config,
  pkgs,
  ...
}: {
  home-manager.users."${config.vars.username}" = {
    home = {
      packages = with pkgs; [
        rofi
      ];
      file.".config/rofi".source = ./rofi;
    };
  };
}
