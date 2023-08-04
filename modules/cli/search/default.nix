{ pkgs, ... }: {
  home.packages = with pkgs; [
    fd
    ripgrep
  ];
  imports = [
    ./skim
  ];
}
