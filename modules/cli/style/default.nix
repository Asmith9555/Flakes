{
  home.packages = with pkgs [
    exa
  ];
  imports = [
    ./bat
  ];
}
