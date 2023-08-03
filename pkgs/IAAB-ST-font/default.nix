{ lib, stdenv, ... }:

stdenv.mkDerivation rec {
  pname = "IAAB-ST-font";
  version = "1.0.0";
  
   src = builtins.fetchGit {
      url = "git@github.com:Asmith9555/IAAB-ST.git";
      rev = "9c49a90083a65c5d60761a5c73f4c00e264fd115";
      ref = "master";
      # sha256 = "03c4b734d8be254fe81b1834eee799f75a93c51e75e837b3a2fb3338144968d2";
   };

  installPhase = ''
    mkdir -p $out/share/fonts/opentype/IAABST
    cp $src/*.otf $out/share/fonts/opentype/IAABST/
  '';

  meta = {
      description = "IAAB-ST Font Package";
  };
}
