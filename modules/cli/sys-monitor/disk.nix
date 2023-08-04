{pkgs, ...}: {
  home.packages = with pkgs; [
    dua
    du-dust
  ];
}
