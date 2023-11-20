{pkgs, ...}: {
  home.packages = with pkgs; [
    just
    gnumake
    steam-run
  ];
}
