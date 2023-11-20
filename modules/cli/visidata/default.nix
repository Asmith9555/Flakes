{pkgs, ...}: {
  home.packages = with pkgs; [
    visidata
    xclip
  ];
}
