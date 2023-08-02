{pkgs, ...}: {
  environment.defaultPackages = with pkgs; [
    exa
  ];
}
