{pkgs, ...}: {
  environment.defaultPackages = with pkgs; [
    unzip
    zip
  ];
}
