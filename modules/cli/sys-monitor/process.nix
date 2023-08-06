{pkgs, ...}: {
  home.packages = with pkgs; [
    procs
  ];
  programs.bottom = {
    enable = true;
  };
}
