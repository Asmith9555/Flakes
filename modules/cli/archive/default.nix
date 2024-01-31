{pkgs, ...}: {
  home.packages = with pkgs; [
    unzip
    zip
    p7zip
  ];
}
