{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  shellHook = ''
    fish
  '';
  nativeBuildInputs = with pkgs; [ git neovim just ];
}
