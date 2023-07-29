{ lib, stdenv, fetchzip, pkgs, ... }:

stdenv.mkDerivation rec {
  pname = "berkeley-mono-font";
  version = "1.0.0";

  src = readDir {
     path = ../../modules/fonts/berkeley-mono;
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/BerkeleyMono/
    mv $src/TTF/* $out/share/fonts/truetype/BerkeleyMono/
  '';

  meta = {
    description = "Berkeley Mono Font Package";
  };
}
