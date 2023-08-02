{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      joshuto
    ];
    file.".config/joshuto".source = ./config;
  };
}
