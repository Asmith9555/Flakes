{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      file
      joshuto
    ];
    file.".config/joshuto".source = ./config;
  };
}
