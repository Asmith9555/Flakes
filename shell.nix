{ pkgs ? import <nixpkgs> { } }:
let
  my-python-packages = ps: with ps; [
    pandas
    requests
    tkinter
    # other python packages
  ];
in
pkgs.mkShell {
  shellHook = ''
    fish
  '';
  packages = [
    (pkgs.python3.withPackages my-python-packages)
  ];
  nativeBuildInputs = with pkgs; [ git neovim just ];
}
